# Lab 1

本实验包含 Flutter 环境准备和第一个原生 Android App。

## 实验要求

原文见 [实验文档](instructions/SSW3401%20Lab%201%20-%20Student.docx)。

## Task 1 Flutter 开发环境

- 已检查 Flutter 和 Android 开发工具，Android 环境检查通过。
- 截图须包含 flutter doctor 结果、桌面和当前时间，以图片提交，不压缩。
- `screenshots/` 用于保存该截图；目前截图文件尚未归档。
- [安装教程](https://www.youtube.com/watch?v=CD1Y2DmL5JM)，实验要求看到 56:19。

## Task 2 原生 Android App

- [项目源代码](android-app/)
- [最终演示录像](recordings/task2-demo.mp4)
- [提交用源码 ZIP](submission/SSW3401-Lab1-Task2-Source.zip)
- [老师指定教程](https://www.youtube.com/watch?v=SJw3Nu_h8kk)

项目使用 Kotlin 和 Jetpack Compose，显示 Hello Android，并输出 Activity 生命周期日志。

使用 Android Studio 打开本实验的 `android-app` 文件夹，等待项目同步，选择 Pixel 8 模拟器，然后点击运行按钮。

在 Logcat 中输入以下筛选条件：

```text
package:com.example.lab1nativeapp tag:System.out
```

| 操作 | 观察到的日志 |
| --- | --- |
| 首次启动 | onCreate → onStart → onResume |
| 按 Home 切到后台 | onPause → onStop |
| 从最近任务返回 | onRestart → onStart → onResume |
| 旋转屏幕 | onPause → onStop → onDestroy，然后 onCreate → onStart → onResume |

已通过实际编译，并在 Pixel 8 模拟器上验证上述操作。最终 MP4 演示包含 App 显示、切到后台和返回前台。

## 提交文件

1. Task 1：`screenshots/` 中的 flutter doctor 图片，归档后单独提交。
2. Task 2：`submission/SSW3401-Lab1-Task2-Source.zip` 和 `recordings/task2-demo.mp4`。

源码 ZIP 包含完整 Android Studio 项目；解压后打开其中的项目文件夹。
