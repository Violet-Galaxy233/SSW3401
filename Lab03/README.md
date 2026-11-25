# Lab 3 — Advanced Flutter GUI

This lab continues the Lab 2 ticket-booking project from 03:03:00 through the final hotel detail and back-navigation chapter.

See the [original assignment](instructions/SSW3401%20Lab%203.docx).

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

Verified on 25 November 2026 with Flutter 3.47.9 and Dart 3.13.7:

- `flutter analyze --no-pub` passed with no issues.
- `flutter test --no-pub --reporter expanded` passed all five tests: bundled image decoding, bottom navigation, selecting the correct flight and returning, flight and hotel search, and the home screen at 320 logical pixels with 200% text size.
- `flutter build apk --debug --no-pub` successfully built the Android APK.
- Section headings move the View all action below the title when enlarged text needs more space. Ticket airport codes and the flight path use separate rows on narrow screens with enlarged text.
- The [demonstration](recordings/lab3-demo.mp4) shows the running Flutter interface with automated taps and mobile dimensions. The [screenshots](screenshots/) show the same demonstration run, including flight details, search results, ticket tabs, the hotel grid, hotel details, and Back.

The demonstration was recorded before the enlarged-text layout correction. The correction preserves the standard-size layout and is covered by the passing regression test.

## PutraBLAST submission

Submitted on **25 November 2026 at 4:32 PM Malaysia time**. PutraBLAST confirms **Submitted for grading**, seven days and six hours before the deadline of 2 December 2026 at 11:00 PM.

The submission page provides file uploads without an online-text field. The submitted files are:

- [GitHub-Link.txt](submission/GitHub-Link.txt), containing the public repository and Lab 3 links.
- [lab3-demo.mp4](recordings/lab3-demo.mp4), the demonstration recording.

A screenshot of the confirmation is archived locally at `recordings/raw/submission-confirmation.jpg` and is excluded from GitHub.

- [Assigned video from 03:03:00](https://www.youtube.com/watch?v=DsTMhjaRQws&t=10980s)
- [Tutorial notes and sample data](https://www.dbestech.com/tutorials/flutter-ticket-booking-app)
