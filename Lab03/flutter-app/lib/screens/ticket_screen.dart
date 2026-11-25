import 'package:flutter/material.dart';

import '../data/catalog.dart';
import '../res/styles/app_styles.dart';
import '../widgets/choice_tabs.dart';
import '../widgets/ticket_view.dart';

class TicketsScreen extends StatefulWidget {
  const TicketsScreen({super.key});

  @override
  State<TicketsScreen> createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen> {
  var _selected = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text('Tickets', style: AppStyles.headLineStyle1),
        const SizedBox(height: 16),
        ChoiceTabs(
          labels: const ['Upcoming', 'Previous'],
          selected: _selected,
          onSelect: (value) => setState(() => _selected = value),
        ),
        const SizedBox(height: 18),
        TicketDetails(index: _selected),
      ],
    );
  }
}

class TicketDetailScreen extends StatelessWidget {
  const TicketDetailScreen({required this.index, super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ticket Details')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [TicketDetails(index: index)],
      ),
    );
  }
}

class TicketDetails extends StatelessWidget {
  const TicketDetails({required this.index, super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    final ticket = flights[index];
    final paper = Theme.of(context).scaffoldBackgroundColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TicketView(ticket, detail: true),
        const SizedBox(height: 12),
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const _DetailRow(
                    'Sample Passenger',
                    'Passenger',
                    '5221  478566',
                    'Passport',
                  ),
                  _DetailRow(
                    '0055  ${ticket['number']}',
                    'E-ticket number',
                    'BK${ticket['number']}',
                    'Booking code',
                  ),
                  const _DetailRow(
                    'Card',
                    'Payment method',
                    'USD 249.99',
                    'Price',
                  ),
                  const DashedLine(color: Color(0xFF9199A7)),
                  const SizedBox(height: 16),
                  Semantics(
                    label: 'Illustrative boarding pass barcode',
                    child: CustomPaint(
                      size: const Size(double.infinity, 42),
                      painter: _BoardingPassBars(index),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(left: -9, bottom: 65, child: _DetailNotch(paper)),
            Positioned(right: -9, bottom: 65, child: _DetailNotch(paper)),
          ],
        ),
      ],
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow(this.left, this.leftLabel, this.right, this.rightLabel);

  final String left;
  final String leftLabel;
  final String right;
  final String rightLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: TicketField(left, leftLabel)),
          const SizedBox(width: 12),
          Expanded(
            child: TicketField(right, rightLabel, alignment: TextAlign.end),
          ),
        ],
      ),
    );
  }
}

class _DetailNotch extends StatelessWidget {
  const _DetailNotch(this.color);

  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    width: 18,
    height: 18,
    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
  );
}

class _BoardingPassBars extends CustomPainter {
  const _BoardingPassBars(this.index);

  final int index;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = AppStyles.textColor;
    final unit = size.width / 104;
    for (var i = 0; i < 104;) {
      final width = 1 + (i + index) % 3;
      canvas.drawRect(
        Rect.fromLTWH(i * unit, 0, width * unit, size.height),
        paint,
      );
      i += width + 1 + (i % 2);
    }
  }

  @override
  bool shouldRepaint(_BoardingPassBars oldDelegate) =>
      oldDelegate.index != index;
}
