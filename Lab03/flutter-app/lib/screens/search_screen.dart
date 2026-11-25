import 'package:flutter/material.dart';

import '../base/app_routes.dart';
import '../data/catalog.dart';
import '../res/styles/app_styles.dart';
import '../widgets/choice_tabs.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _selected = 0;
  final _departure = TextEditingController();
  final _arrival = TextEditingController();
  final _city = TextEditingController();

  @override
  void dispose() {
    _departure.dispose();
    _arrival.dispose();
    _city.dispose();
    super.dispose();
  }

  bool _matchesAirport(Map<String, String> airport, String query) {
    final value = query.trim().toLowerCase();
    return airport['code']!.toLowerCase().contains(value) ||
        airport['name']!.toLowerCase().contains(value);
  }

  void _search() {
    FocusScope.of(context).unfocus();
    if (_selected == 0) {
      final results = [
        for (final (index, ticket) in flights.indexed)
          if (_matchesAirport(
                ticket['from'] as Map<String, String>,
                _departure.text,
              ) &&
              _matchesAirport(
                ticket['to'] as Map<String, String>,
                _arrival.text,
              ))
            index,
      ];
      Navigator.pushNamed(context, AppRoutes.allTickets, arguments: results);
    } else {
      final value = _city.text.trim().toLowerCase();
      final results = [
        for (final (index, hotel) in hotels.indexed)
          if ((hotel['destination'] as String).toLowerCase().contains(value) ||
              (hotel['place'] as String).toLowerCase().contains(value))
            index,
      ];
      Navigator.pushNamed(context, AppRoutes.allHotels, arguments: results);
    }
  }

  @override
  Widget build(BuildContext context) {
    final searchingFlights = _selected == 0;
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'What are you looking for?',
          style: AppStyles.headLineStyle1,
        ),
        const SizedBox(height: 18),
        ChoiceTabs(
          labels: const ['Airline Tickets', 'Hotels'],
          selected: _selected,
          onSelect: (value) => setState(() => _selected = value),
        ),
        const SizedBox(height: 18),
        if (searchingFlights) ...[
          _SearchField(
            icon: Icons.flight_takeoff,
            label: 'Departure',
            controller: _departure,
          ),
          const SizedBox(height: 12),
          _SearchField(
            icon: Icons.flight_land,
            label: 'Arrival',
            controller: _arrival,
          ),
        ] else
          _SearchField(
            icon: Icons.location_city_outlined,
            label: 'Destination',
            controller: _city,
          ),
        const SizedBox(height: 16),
        FilledButton(
          onPressed: _search,
          child: Text(searchingFlights ? 'Find tickets' : 'Find hotels'),
        ),
        const SizedBox(height: 26),
        const Text('Upcoming Flights', style: AppStyles.headLineStyle2),
        const SizedBox(height: 12),
        const _TravelOffers(),
      ],
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({
    required this.icon,
    required this.label,
    required this.controller,
  });

  final IconData icon;
  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) => TextField(
    controller: controller,
    decoration: InputDecoration(
      prefixIcon: Icon(icon),
      labelText: label,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );
}

class _TravelOffers extends StatelessWidget {
  const _TravelOffers();

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Stack(
        alignment: Alignment.bottomLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/search_offer.png',
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xE8233667),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'Plan your next trip',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
      const SizedBox(height: 12),
      const _OfferTile(
        icon: Icons.airplane_ticket_outlined,
        text: 'Discounts on selected flights',
      ),
      const SizedBox(height: 10),
      const _OfferTile(
        icon: Icons.hotel_outlined,
        text: 'Explore stays at your destination',
      ),
    ],
  );
}

class _OfferTile extends StatelessWidget {
  const _OfferTile({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) => Card(
    margin: EdgeInsets.zero,
    child: ListTile(
      leading: Icon(icon, color: AppStyles.primaryColor),
      title: Text(text),
    ),
  );
}
