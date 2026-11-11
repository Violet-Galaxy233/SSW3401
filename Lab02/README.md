# Lab 2: Understanding the Basics of Flutter GUI

Implements the assigned tutorial through **03:03:00**: four bottom navigation tabs, screen switching, home-header text layout, and a local image.

## Files

| Item | Location |
| --- | --- |
| Original assignment | [Assignment document](instructions/SSW3401%20Lab%202.docx) |
| Flutter project source | [flutter-app](flutter-app/) |
| Home screenshot | [01-home.png](screenshots/01-home.png) |
| Search screenshot | [02-search.png](screenshots/02-search.png) |
| Tickets screenshot | [03-tickets.png](screenshots/03-tickets.png) |
| Profile screenshot | [04-profile.png](screenshots/04-profile.png) |
| Demonstration recording | [lab2-demo.mp4](recordings/lab2-demo.mp4) |
| Source archive | [SSW3401-Lab2-Source.zip](submission/SSW3401-Lab2-Source.zip) |
| GitHub links for submission | [GitHub-Link.txt](submission/GitHub-Link.txt) |

## Tutorial coverage

| Tutorial topic | Implementation |
| --- | --- |
| main, MaterialApp, Scaffold | Application entry point, theme, and screen container |
| BottomNavigationBar | Home, Search, Tickets, and Profile tabs |
| StatefulWidget and setState | Updates the screen and selected icon when a tab is tapped |
| Home layout and text styles | Good morning, Book Tickets, Row, Column, Container, and shared styles |
| Image container at 02:51:06 | A 50 × 50 container with rounded corners |
| Image display from 02:56:55 through 03:03:00 | PNG registered in pubspec.yaml and displayed with AssetImage and DecorationImage |

The Search icon / Empty space row and the text on Search, Tickets, and Profile retain the tutorial placeholders at this point. The search bar, ticket lists, and hotel lists appear later in the course.

The original asset download returned HTTP 403 on 11 November 2026. This project uses an original airplane PNG in place of the tutorial logo, with the same image-loading approach and rounded layout. See [asset details](flutter-app/assets/README.md) for the source and generator.

## Run and verification

Open this lab's `flutter-app` folder, start an Android emulator, then run:

```sh
flutter pub get
flutter run
```

- `flutter analyze` passed with no issues.
- All three Flutter tests passed: actual image decoding, navigation through all four screens and back, and a narrow-screen layout with enlarged text.
- The app was built, installed, and manually verified on a Pixel 8 emulator.
- The recording shows Home, Search, Tickets, Profile, and a return to Home.

## PutraBLAST submission

Submitted for grading on **11 November 2026 at 1:47 PM**, before the 11:00 PM deadline.

The submission page provides file uploads without an online-text field. The following files were uploaded:

1. `submission/GitHub-Link.txt`, containing the repository and Lab 2 source links.
2. `recordings/lab2-demo.mp4`, the 35-second demonstration recording.

Repository: https://github.com/Violet-Galaxy233/SSW3401

Lab 2: https://github.com/Violet-Galaxy233/SSW3401/tree/main/Lab02

The optional source archive is available at `submission/SSW3401-Lab2-Source.zip`. The repository also contains the complete source as individual files.

The submission confirmation screenshot is archived locally at `recordings/raw/submission-confirmation.png` and is excluded from GitHub.

## References

- [Assigned video](https://www.youtube.com/watch?v=DsTMhjaRQws)
- [Original course assets page](https://www.dbestech.com/tutorials/flutter-ticket-booking-app)
- [Flutter image documentation](https://docs.flutter.dev/ui/assets/assets-and-images)
