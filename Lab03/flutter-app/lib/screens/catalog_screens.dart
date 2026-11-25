import 'package:flutter/material.dart';

import '../base/app_routes.dart';
import '../data/catalog.dart';
import '../res/styles/app_styles.dart';
import '../widgets/hotel_card.dart';
import '../widgets/ticket_view.dart';

class AllFlightsScreen extends StatelessWidget {
  const AllFlightsScreen({this.indices, super.key});

  final List<int>? indices;

  @override
  Widget build(BuildContext context) {
    final items =
        indices ?? List<int>.generate(flights.length, (index) => index);
    return Scaffold(
      appBar: AppBar(
        title: Text(indices == null ? 'All Flights' : 'Flight Results'),
      ),
      body: items.isEmpty
          ? const Center(child: Text('No matching flights.'))
          : ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: items.length,
              separatorBuilder: (_, _) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final flightIndex = items[index];
                return TicketView(
                  flights[flightIndex],
                  key: ValueKey('flight-$flightIndex'),
                  onTap: () => Navigator.pushNamed(
                    context,
                    AppRoutes.ticketScreen,
                    arguments: flightIndex,
                  ),
                );
              },
            ),
    );
  }
}

class AllHotelsScreen extends StatelessWidget {
  const AllHotelsScreen({this.indices, super.key});

  final List<int>? indices;

  @override
  Widget build(BuildContext context) {
    final items =
        indices ?? List<int>.generate(hotels.length, (index) => index);
    return Scaffold(
      appBar: AppBar(
        title: Text(indices == null ? 'All Hotels' : 'Hotel Results'),
      ),
      body: items.isEmpty
          ? const Center(child: Text('No matching hotels.'))
          : LayoutBuilder(
              builder: (context, constraints) {
                final textScale =
                    MediaQuery.textScalerOf(context).scale(16) / 16;
                final columns = constraints.maxWidth < 360 || textScale > 1.4
                    ? 1
                    : 2;
                final itemWidth =
                    (constraints.maxWidth - 40 - (columns - 1) * 12) / columns;
                return GridView.builder(
                  padding: const EdgeInsets.all(20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    mainAxisExtent: itemWidth / 1.65 + 29 + 83 * textScale,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final hotelIndex = items[index];
                    return HotelCard(
                      hotels[hotelIndex],
                      key: ValueKey('hotel-$hotelIndex'),
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes.hotelDetail,
                        arguments: hotelIndex,
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}

class HotelDetailScreen extends StatelessWidget {
  const HotelDetailScreen({required this.index, super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    final hotel = hotels[index];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 240,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                hotel['image'] as String,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
            sliver: SliverList.list(
              children: [
                Text(hotel['place'] as String, style: AppStyles.headLineStyle1),
                const SizedBox(height: 8),
                Text(
                  hotel['destination'] as String,
                  style: AppStyles.headLineStyle3,
                ),
                const SizedBox(height: 18),
                Text(
                  '\$${hotel['price']} / night',
                  style: AppStyles.headLineStyle2,
                ),
                const SizedBox(height: 24),
                const Text('About this hotel', style: AppStyles.headLineStyle2),
                const SizedBox(height: 8),
                Text(
                  hotel['description'] as String,
                  style: AppStyles.headLineStyle3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
