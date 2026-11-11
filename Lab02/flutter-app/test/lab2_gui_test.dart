import 'dart:ui' as ui;

import 'package:flutter/foundation.dart' show ValueKey;
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab2_flutter_gui/main.dart';

void main() {
  testWidgets('Home displays the greeting and a decodable bundled image', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Good morning'), findsOneWidget);
    expect(find.text('Book Tickets'), findsOneWidget);
    expect(find.text('Search icon'), findsOneWidget);
    expect(find.text('Empty space'), findsOneWidget);

    await tester.runAsync(() async {
      final ByteData data = await rootBundle.load('assets/images/logo.png');
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

    for (final String label in <String>['Search', 'Tickets', 'Profile']) {
      await tester.tap(find.byTooltip(label));
      await tester.pumpAndSettle();
      expect(find.text('Good morning'), findsNothing);
      expect(
        find.descendant(
          of: find.byKey(const ValueKey('main-content')),
          matching: find.text(label),
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
