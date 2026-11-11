import 'package:flutter/material.dart';

import '../res/styles/app_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Good morning', style: AppStyles.headLineStyle3),
                    SizedBox(height: 5),
                    Text('Book Tickets', style: AppStyles.headLineStyle1),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Semantics(
                label: 'Booking logo',
                image: true,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // The search row is only a layout placeholder before 03:03:00.
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(child: Text('Search icon')),
              Expanded(child: Text('Empty space', textAlign: TextAlign.end)),
            ],
          ),
        ],
      ),
    );
  }
}
