# Lab 3 — Advanced Flutter GUI

This lab continues the Lab 2 ticket-booking project from 03:03:00 through the final hotel detail and back-navigation chapter.

| Tutorial section | What the app shows |
| --- | --- |
| 03:03–03:59 | Shared image paths, home search box and reusable section headings |
| 03:59–06:31 | Reusable flight cards with airport codes, a rotated plane, dashed lines and data from Dart maps |
| 06:31–07:42 | Full flight list through named routes and hotel cards with bundled images |
| 07:42–10:30 | Airline and hotel search tabs, the travel offers layout, and Upcoming and Previous ticket details |
| 10:30–end | Correct ticket selection by index, hotel grid, scrollable hotel detail and back navigation |

## Run the app

From `Lab03/flutter-app`, start an Android emulator and run:

```sh
flutter pub get
flutter run
```

The project uses Flutter 3.47.9 and Dart 3.13.7. Flights and hotels use the tutorial's sample data. Search filters that data locally. The booking fields and boarding-pass graphic are examples for the GUI exercise.

## Verification and demonstration

- `flutter analyze` passed. `flutter build bundle --no-pub` compiled the app and assets.
- A Flutter engine run checked navigation and filtering, including the second flight's details, the Tickets tabs, the hotel grid, a hotel detail screen and Back. The flight detail screen was also checked at 320 logical pixels and 200% text size.
- The [demonstration](recordings/lab3-demo.mp4) records the running Flutter interface with automated taps and mobile dimensions. The [screenshots](screenshots/) show the same run.

The Android emulator, APK build and standard widget-test command require local sockets that were unavailable in the verification environment.

## Submit on PutraBLAST

Paste the public repository URL listed in [GitHub-Link.txt](submission/GitHub-Link.txt) and upload [lab3-demo.mp4](recordings/lab3-demo.mp4).

Due Wednesday, 2 December 2026 at 11:00 PM Malaysia time.

- [Assigned video from 03:03:00](https://www.youtube.com/watch?v=DsTMhjaRQws&t=10980s)
- [Tutorial notes and sample data](https://www.dbestech.com/tutorials/flutter-ticket-booking-app)
