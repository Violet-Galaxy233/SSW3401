import 'package:flutter/material.dart';

import '../base/app_routes.dart';
import '../data/catalog.dart';
import '../res/media/app_media.dart';
import '../res/styles/app_styles.dart';
import '../widgets/hotel_card.dart';
import '../widgets/section_heading.dart';
import '../widgets/ticket_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({required this.onSearch, super.key});

  final VoidCallback onSearch;

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
                      image: AssetImage(AppMedia.logo),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Material(
            color: AppStyles.searchBackgroundColor,
            borderRadius: BorderRadius.circular(10),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              key: const ValueKey('home-search'),
              onTap: onSearch,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Row(
                  children: [
                    Icon(Icons.search, color: AppStyles.navigationColor),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text('Search', style: AppStyles.headLineStyle3),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 22),
          SectionHeading(
            title: 'Upcoming Flights',
            onViewAll: () => Navigator.pushNamed(context, AppRoutes.allTickets),
          ),
          const SizedBox(height: 7),
          LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final (index, ticket) in flights.indexed)
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: SizedBox(
                        width: constraints.maxWidth > 380
                            ? 340
                            : constraints.maxWidth,
                        child: TicketView(
                          ticket,
                          onTap: () => Navigator.pushNamed(
                            context,
                            AppRoutes.ticketScreen,
                            arguments: index,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 18),
          SectionHeading(
            title: 'Hotels',
            onViewAll: () => Navigator.pushNamed(context, AppRoutes.allHotels),
          ),
          const SizedBox(height: 7),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final (index, hotel) in hotels.indexed)
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: SizedBox(
                      width: 184,
                      child: HotelCard(
                        hotel,
                        onTap: () => Navigator.pushNamed(
                          context,
                          AppRoutes.hotelDetail,
                          arguments: index,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
