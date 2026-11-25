import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../res/styles/app_styles.dart';
import '../screens/home_screen.dart';
import '../screens/search_screen.dart';
import '../screens/ticket_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        key: const ValueKey('main-content'),
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            HomeScreen(onSearch: () => _onItemTapped(1)),
            const SearchScreen(),
            const TicketsScreen(),
            const Center(child: Text('Profile')),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 10,
        selectedItemColor: Colors.blue,
        unselectedItemColor: AppStyles.navigationColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.home_20_regular),
            activeIcon: Icon(FluentIcons.home_20_filled),
            label: 'Home',
            tooltip: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.search_20_regular),
            activeIcon: Icon(FluentIcons.search_20_filled),
            label: 'Search',
            tooltip: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.ticket_diagonal_20_regular),
            activeIcon: Icon(FluentIcons.ticket_diagonal_20_filled),
            label: 'Tickets',
            tooltip: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.person_20_regular),
            activeIcon: Icon(FluentIcons.person_20_filled),
            label: 'Profile',
            tooltip: 'Profile',
          ),
        ],
      ),
    );
  }
}
