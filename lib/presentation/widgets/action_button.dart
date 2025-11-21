import 'package:flutter/material.dart';
import 'package:picturator/core/theme/app_theme.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.onTap,
    this.buttonColor,
    this.textColor,
    required this.title
  });

  final VoidCallback? onTap;
  final Color? buttonColor;
  final Color? textColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
        decoration: BoxDecoration(
            color: onTap != null
                ? buttonColor ?? AppTheme.primaryColor
                : Colors.grey.withValues(alpha: 0.35),
            borderRadius: BorderRadius.circular(40)
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
