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
    return Row(
      children: [
        Expanded(child: Text(title, style: AppStyles.headLineStyle2)),
        TextButton(
          onPressed: onViewAll,
          child: Text(
            'View all',
            style: AppStyles.headLineStyle3.copyWith(
              color: AppStyles.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
