# Lab 2 Flutter GUI

SSW3401 implementation of the assigned Flutter course through 03:03:00.

## Implemented behavior

- Four bottom navigation items with regular and filled Fluent icons.
- Stateful selection and Home, Search, Tickets and Profile screens.
- Home header using Column, Row, Container, padding, spacing and shared text styles.
- A rounded 50 by 50 local image loaded through AssetImage and DecorationImage.
- The search row and three other screens retain the tutorial placeholders at this cutoff.

The original tutorial asset download returned HTTP 403. The bundled airplane image is an original substitute; see [asset details](assets/README.md).

## Run

Open this `flutter-app` directory in an editor with Flutter support, start an Android emulator, then run:

```sh
flutter pub get
flutter run
```

Verified with Flutter 3.47.9, Dart 3.13.7 and a Pixel 8 Android emulator. Android SDK 36 and NDK 28.2.13676358 are selected by the generated Flutter Android build configuration. The original development machine uses Android Studio's bundled Java 25.

## Check

```sh
flutter analyze
flutter test
```

Three checks cover the bundled image decoding, all navigation tabs and return to Home, and narrow screens with enlarged text.

## Code map

- `lib/main.dart`: main entry point and MaterialApp.
- `lib/base/bottom_nav_bar.dart`: selected tab state, setState and bottom navigation.
- `lib/screens/home_screen.dart`: header layout, placeholder row and image.
- `lib/res/styles/app_styles.dart`: shared colors and text styles.
- `pubspec.yaml`: dependency and local image registration.

## References

- [Assigned video](https://www.youtube.com/watch?v=DsTMhjaRQws)
- [Course resources](https://www.dbestech.com/tutorials/flutter-ticket-booking-app)
- [Flutter image documentation](https://docs.flutter.dev/ui/assets/assets-and-images)
