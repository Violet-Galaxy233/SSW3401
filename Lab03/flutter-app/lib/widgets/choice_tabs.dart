import 'package:flutter/material.dart';

import '../res/styles/app_styles.dart';

class ChoiceTabs extends StatelessWidget {
  const ChoiceTabs({
    required this.labels,
    required this.selected,
    required this.onSelect,
    super.key,
  });

  final List<String> labels;
  final int selected;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppStyles.searchBackgroundColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          for (var index = 0; index < labels.length; index++)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Semantics(
                  selected: selected == index,
                  child: TextButton(
                    onPressed: () => onSelect(index),
                    style: TextButton.styleFrom(
                      foregroundColor: AppStyles.textColor,
                      backgroundColor: selected == index
                          ? Colors.white
                          : Colors.transparent,
                      shape: const StadiumBorder(),
                    ),
                    child: Text(labels[index], textAlign: TextAlign.center),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
