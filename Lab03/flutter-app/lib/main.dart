import 'package:flutter/material.dart';

import 'base/app_routes.dart';
import 'base/bottom_nav_bar.dart';
import 'data/catalog.dart';
import 'res/styles/app_styles.dart';
import 'screens/catalog_screens.dart';
import 'screens/ticket_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Tickets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppStyles.backgroundColor,
      ),
      home: const BottomNavBar(),
      routes: {
        AppRoutes.allTickets: (context) => AllFlightsScreen(
          indices: ModalRoute.of(context)?.settings.arguments as List<int>?,
        ),
        AppRoutes.allHotels: (context) => AllHotelsScreen(
          indices: ModalRoute.of(context)?.settings.arguments as List<int>?,
        ),
        AppRoutes.ticketScreen: (context) =>
            TicketDetailScreen(index: _catalogIndex(context, flights.length)),
        AppRoutes.hotelDetail: (context) =>
            HotelDetailScreen(index: _catalogIndex(context, hotels.length)),
      },
    );
  }
}

int _catalogIndex(BuildContext context, int length) {
  final argument = ModalRoute.of(context)?.settings.arguments;
  return argument is int && argument >= 0 && argument < length ? argument : 0;
}
