import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../res/styles/app_styles.dart';

class TicketView extends StatelessWidget {
  const TicketView(this.ticket, {this.detail = false, this.onTap, super.key});

  final Map<String, dynamic> ticket;
  final bool detail;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final from = ticket['from'] as Map<String, String>;
    final to = ticket['to'] as Map<String, String>;
    final routeColor = detail ? Colors.white : AppStyles.ticketBlue;
    final infoColor = detail ? Colors.white : AppStyles.ticketOrange;
    final foreground = detail ? AppStyles.textColor : Colors.white;
    final paper = Theme.of(context).scaffoldBackgroundColor;

    return Material(
      color: routeColor,
      borderRadius: BorderRadius.circular(18),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 15, 16, 11),
              child: Column(
                children: [
                  Row(
                    children: [
                      _AirportCode(from['code']!, foreground),
                      Expanded(
                        child: Row(
                          children: [
                            _RouteDot(foreground),
                            Expanded(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  DashedLine(color: foreground),
                                  ColoredBox(
                                    color: routeColor,
                                    child: Transform.rotate(
                                      angle: math.pi / 2,
                                      child: Icon(
                                        Icons.flight,
                                        color: foreground,
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            _RouteDot(foreground),
                          ],
                        ),
                      ),
                      _AirportCode(to['code']!, foreground),
                    ],
                  ),
                  const SizedBox(height: 9),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          from['name']!,
                          style: TextStyle(color: foreground),
                        ),
                      ),
                      Text(
                        ticket['flying_time'] as String,
                        style: TextStyle(color: foreground),
                      ),
                      Expanded(
                        child: Text(
                          to['name']!,
                          textAlign: TextAlign.end,
                          style: TextStyle(color: foreground),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ColoredBox(
              color: infoColor,
              child: Column(
                children: [
                  Row(
                    children: [
                      _TicketNotch(paper, left: true),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: DashedLine(
                            color: foreground.withValues(alpha: .64),
                          ),
                        ),
                      ),
                      _TicketNotch(paper, left: false),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TicketField(
                            ticket['date'] as String,
                            'Date',
                            color: foreground,
                          ),
                        ),
                        Expanded(
                          child: TicketField(
                            ticket['departure_time'] as String,
                            'Departure time',
                            alignment: TextAlign.center,
                            color: foreground,
                          ),
                        ),
                        Expanded(
                          child: TicketField(
                            ticket['number'].toString(),
                            'Number',
                            alignment: TextAlign.end,
                            color: foreground,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TicketField extends StatelessWidget {
  const TicketField(
    this.value,
    this.label, {
    this.alignment = TextAlign.start,
    this.color = AppStyles.textColor,
    super.key,
  });

  final String value;
  final String label;
  final TextAlign alignment;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          value,
          textAlign: alignment,
          style: TextStyle(
            color: color,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: alignment,
          style: TextStyle(color: color, fontSize: 12),
        ),
      ],
    );
  }
}

class DashedLine extends StatelessWidget {
  const DashedLine({required this.color, super.key});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final count = (constraints.maxWidth / 8).floor();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            count,
            (_) =>
                SizedBox(width: 4, height: 1, child: ColoredBox(color: color)),
          ),
        );
      },
    );
  }
}

class _AirportCode extends StatelessWidget {
  const _AirportCode(this.code, this.color);

  final String code;
  final Color color;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 6),
    child: Text(
      code,
      style: TextStyle(color: color, fontSize: 19, fontWeight: FontWeight.w700),
    ),
  );
}

class _RouteDot extends StatelessWidget {
  const _RouteDot(this.color);

  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    width: 8,
    height: 8,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: color, width: 2),
    ),
  );
}

class _TicketNotch extends StatelessWidget {
  const _TicketNotch(this.color, {required this.left});

  final Color color;
  final bool left;

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(9);
    return Container(
      width: 9,
      height: 18,
      decoration: BoxDecoration(
        color: color,
        borderRadius: left
            ? const BorderRadius.horizontal(right: radius)
            : const BorderRadius.horizontal(left: radius),
      ),
    );
  }
}
