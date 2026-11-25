import 'dart:ui' as ui;

import 'package:flutter/foundation.dart' show ValueKey;
import 'package:flutter/material.dart' show Icons, TextField;
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab2_flutter_gui/main.dart';
import 'package:lab2_flutter_gui/res/media/app_media.dart';

void main() {
  testWidgets('Home displays the greeting and a decodable bundled image', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Good morning'), findsOneWidget);
    expect(find.text('Book Tickets'), findsOneWidget);
    expect(find.byKey(const ValueKey('home-search')), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);

    await tester.runAsync(() async {
      final ByteData data = await rootBundle.load(AppMedia.logo);
      final ui.Codec codec = await ui.instantiateImageCodec(
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
      );
      final ui.FrameInfo frame = await codec.getNextFrame();
      expect(frame.image.width, greaterThan(0));
      expect(frame.image.height, greaterThan(0));
      frame.image.dispose();
      codec.dispose();
    });
    expect(tester.takeException(), isNull);
  });

  testWidgets('All navigation tabs open and Home can be reached again', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    const destinations = {
      'Search': 'What are you looking for?',
      'Tickets': 'Upcoming',
      'Profile': 'Profile',
    };
    for (final MapEntry(:key, :value) in destinations.entries) {
      await tester.tap(find.byTooltip(key));
      await tester.pumpAndSettle();
      expect(find.text('Good morning'), findsNothing);
      expect(
        find.descendant(
          of: find.byKey(const ValueKey('main-content')),
          matching: find.text(value),
        ),
        findsOneWidget,
      );
      expect(tester.takeException(), isNull);
    }

    await tester.tap(find.byTooltip('Home'));
    await tester.pumpAndSettle();
    expect(find.text('Good morning'), findsOneWidget);
    expect(find.text('Book Tickets'), findsOneWidget);
  });

  testWidgets(
    'Flight details use the selected ticket and Back restores the list',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('View all').first);
      await tester.pumpAndSettle();
      expect(find.text('All Flights'), findsOneWidget);

      await tester.tap(find.byKey(const ValueKey('flight-1')));
      await tester.pumpAndSettle();
      expect(find.text('Ticket Details'), findsOneWidget);
      expect(find.text('BK45'), findsOneWidget);
      expect(find.text('Shanghai'), findsOneWidget);
      expect(find.text('BK23'), findsNothing);

      await tester.tap(find.byTooltip('Back'));
      await tester.pumpAndSettle();
      expect(find.text('All Flights'), findsOneWidget);
    },
  );

  testWidgets(
    'Search filters flights and hotels and opens the matching hotel',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const ValueKey('home-search')));
      await tester.pumpAndSettle();

      await tester.enterText(find.widgetWithText(TextField, 'Departure'), 'DK');
      await tester.tap(find.text('Find tickets'));
      await tester.pumpAndSettle();
      expect(find.text('Flight Results'), findsOneWidget);
      expect(find.byKey(const ValueKey('flight-1')), findsOneWidget);
      expect(find.byKey(const ValueKey('flight-0')), findsNothing);

      await tester.tap(find.byTooltip('Back'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Hotels'));
      await tester.pumpAndSettle();
      await tester.enterText(
        find.widgetWithText(TextField, 'Destination'),
        'Dubai',
      );
      await tester.tap(find.text('Find hotels'));
      await tester.pumpAndSettle();
      expect(find.text('Hotel Results'), findsOneWidget);
      expect(find.byKey(const ValueKey('hotel-0')), findsNothing);

      await tester.tap(find.byKey(const ValueKey('hotel-2')));
      await tester.pumpAndSettle();
      expect(find.text('Tallest Building'), findsOneWidget);
      expect(find.text('About this hotel'), findsOneWidget);
    },
  );

  testWidgets('Header fits a narrow screen with enlarged system text', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(320, 568);
    tester.view.devicePixelRatio = 1;
    tester.platformDispatcher.textScaleFactorTestValue = 2;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    expect(find.text('Book Tickets'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
