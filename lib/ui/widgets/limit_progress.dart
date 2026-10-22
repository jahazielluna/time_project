import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../utils/format.dart';

class LimitProgress extends StatelessWidget {
  const LimitProgress({
    super.key,
    required this.minutesUsed,
    required this.limitHours,
  });

  final int minutesUsed;
  final double limitHours;

  @override
  Widget build(BuildContext context) {
    final used = minutesUsed / 60.0;
    final pct = (used / limitHours).clamp(0.0, 1.2);
    final color = pct >= 1
        ? AppColors.danger
        : pct >= 0.8
            ? AppColors.warn
            : AppColors.teal;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${formatHours(minutesUsed)} de ${limitHours.toStringAsFixed(0)}h',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.slate,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Text(
              '${(pct * 100).clamp(0, 999).toStringAsFixed(0)}%',
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: pct.clamp(0.0, 1.0)),
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOutCubic,
            builder: (context, value, _) {
              return LinearProgressIndicator(
                value: value,
                minHeight: 8,
                backgroundColor: AppColors.surfaceAlt,
                color: color,
              );
            },
          ),
        ),
      ],
    );
  }
}
