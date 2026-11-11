# Lab 2 Understanding the Basics of Flutter GUI

已完成老师指定教程截至 **03:03:00** 的功能：四个底部导航标签、页面切换、首页文字排版和本地图片显示。

## 文件位置

| 内容 | 位置 |
| --- | --- |
| 原始实验要求 | [实验文档](instructions/SSW3401%20Lab%202.docx) |
| Flutter 项目源代码 | [flutter-app](flutter-app/) |
| 首页截图 | [01-home.png](screenshots/01-home.png) |
| Search 截图 | [02-search.png](screenshots/02-search.png) |
| Tickets 截图 | [03-tickets.png](screenshots/03-tickets.png) |
| Profile 截图 | [04-profile.png](screenshots/04-profile.png) |
| 实际运行录屏 | [lab2-demo.mp4](recordings/lab2-demo.mp4) |
| 提交用源码包 | [SSW3401-Lab2-Source.zip](submission/SSW3401-Lab2-Source.zip) |

## 与教程对应的功能

| 教程阶段 | 本项目实现 |
| --- | --- |
| main、MaterialApp、Scaffold | 应用入口、主题和页面容器 |
| BottomNavigationBar | Home、Search、Tickets、Profile 四个标签 |
| StatefulWidget 和 setState | 点击标签时更新页面及选中图标 |
| 首页布局和文字样式 | Good morning、Book Tickets、Row、Column、Container 和共用样式类 |
| 02:51:06 图片容器 | 50×50 容器和圆角 |
| 02:56:55 至 03:03:00 图片显示 | 在 pubspec.yaml 注册 PNG，并用 AssetImage 和 DecorationImage 显示 |

首页下方的 Search icon / Empty space，以及 Search、Tickets、Profile 页面中的文字，是视频在这个时间点保留的占位内容。后续课程才继续实现搜索栏、机票和酒店列表。

教程原素材下载在 2026 年 11 月 11 日返回 HTTP 403，因此项目使用自制的飞机 PNG 代替原 logo，图片加载方式和圆角布局与教程一致。生成方式和来源说明见 [assets/README.md](flutter-app/assets/README.md)。

## 运行和验证

打开本实验下的 `flutter-app` 文件夹，启动 Android 模拟器，然后运行 `flutter pub get` 和 `flutter run`。

- 已通过 flutter analyze，无代码问题。
- 已通过全部 3 项 Flutter 检查：真实图片解码、四个页面切换与返回、小屏幕大字体布局。
- 已编译并安装到 Pixel 8 模拟器，逐页操作确认正常。
- 演示录像展示首页、Search、Tickets、Profile，并返回首页。

## 提交到 PutraBLAST

在文本框填写课程仓库链接：

https://github.com/Violet-Galaxy233/SSW3401

Lab 2 的直接访问链接：

https://github.com/Violet-Galaxy233/SSW3401/tree/main/Lab02

上传 `recordings/lab2-demo.mp4`。如需要单独提供源码文件，可使用 `submission/SSW3401-Lab2-Source.zip`；GitHub 中也已按文件保存完整源码。

## 参考

- [老师指定视频](https://www.youtube.com/watch?v=DsTMhjaRQws)
- [教程原素材页面](https://www.dbestech.com/tutorials/flutter-ticket-booking-app)
- [Flutter 官方图片文档](https://docs.flutter.dev/ui/assets/assets-and-images)
