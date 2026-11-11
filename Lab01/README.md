# Lab 1

This lab covers Flutter environment setup and a first native Android app.

## Assignment

See the [original assignment](instructions/SSW3401%20Lab%201%20-%20Student.docx).

## Task 1: Flutter development environment

- Flutter and the Android development tools have been checked; the Android toolchain checks passed.
- Submit a screenshot showing the flutter doctor output, the desktop, and the current time. Submit the image directly without ZIP compression.
- The screenshot belongs in `screenshots/`; it has not yet been located and archived.
- Follow the [assigned setup tutorial](https://www.youtube.com/watch?v=CD1Y2DmL5JM) through 56:19.

## Task 2: Native Android app

- [Project source code](android-app/)
- [Final demonstration recording](recordings/task2-demo.mp4)
- [Source ZIP for submission](submission/SSW3401-Lab1-Task2-Source.zip)
- [Assigned tutorial](https://www.youtube.com/watch?v=SJw3Nu_h8kk)

The app uses Kotlin and Jetpack Compose, displays Hello Android, and prints Activity lifecycle events.

Open this lab's `android-app` folder in Android Studio. Wait for project synchronization, select the Pixel 8 emulator, and run the app.

Use the following Logcat filter:

```text
package:com.example.lab1nativeapp tag:System.out
```

| Action | Observed lifecycle events |
| --- | --- |
| Launch the app | onCreate → onStart → onResume |
| Press Home to move it to the background | onPause → onStop |
| Return through recent apps | onRestart → onStart → onResume |
| Rotate the screen | onPause → onStop → onDestroy, then onCreate → onStart → onResume |

The project was built successfully and these actions were verified on a Pixel 8 emulator. The final MP4 demonstrates the app, moving it to the background, and returning to the foreground.

## Submission files

1. Task 1: the flutter doctor screenshot in `screenshots/`, submitted separately once archived.
2. Task 2: `submission/SSW3401-Lab1-Task2-Source.zip` and `recordings/task2-demo.mp4`.

The source ZIP contains the Android Studio project. Extract it and open the enclosed project folder.

## PutraBLAST status

Checked on 11 November 2026. PutraBLAST reports **No submissions have been made yet** and shows the assignment as overdue by 11 days and 14 hours. The deadline was 30 October 2026 at 11:00 PM. The page offers no Add submission or Edit submission button, so the work could not be submitted. The instructor needs to reopen the submission or provide another submission route.

A screenshot of the status is archived locally at `recordings/raw/submission-status.png` and is excluded from GitHub.
