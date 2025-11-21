import 'package:flutter/material.dart';
import 'package:picturator/presentation/widgets/action_button.dart';

class RetryButton extends StatelessWidget {
  final VoidCallback onRetry;

  const RetryButton({
    super.key,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return ActionButton(
        onTap: onRetry,
        title: 'Retry'
    );
  }
}

