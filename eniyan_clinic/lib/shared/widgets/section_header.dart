import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, this.actionLabel});

  final String title;
  final String? actionLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(title, style: Theme.of(context).textTheme.titleLarge),
        ),
        if (actionLabel != null)
          TextButton(
            onPressed: () {},
            child: Text(
              actionLabel!,
              style: const TextStyle(color: AppColors.blue),
            ),
          ),
      ],
    );
  }
}
