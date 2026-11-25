import 'package:flutter/material.dart';

import '../res/styles/app_styles.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    required this.title,
    required this.onViewAll,
    super.key,
  });

  final String title;
  final VoidCallback onViewAll;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final heading = Text(title, style: AppStyles.headLineStyle2);
        final action = TextButton(
          onPressed: onViewAll,
          child: Text(
            'View all',
            style: AppStyles.headLineStyle3.copyWith(
              color: AppStyles.primaryColor,
            ),
          ),
        );

        if (constraints.maxWidth <
            MediaQuery.textScalerOf(context).scale(240)) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              heading,
              Align(alignment: Alignment.centerRight, child: action),
            ],
          );
        }

        return Row(
          children: [
            Expanded(child: heading),
            action,
          ],
        );
      },
    );
  }
}
