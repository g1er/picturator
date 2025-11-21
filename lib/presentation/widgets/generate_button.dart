import 'package:flutter/material.dart';
import 'package:picturator/presentation/widgets/action_button.dart';

class GenerateButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onPressed;

  const GenerateButton({
    super.key,
    required this.isEnabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      child: ActionButton(
        title: 'Generate',
        onTap: isEnabled ? onPressed : null,
      )
    );
  }
}

