import 'package:flutter/material.dart';
import 'package:picturator/presentation/widgets/action_button.dart';

class ActionButtons extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onTryAnother;
  final VoidCallback onNewPrompt;

  const ActionButtons({
    super.key,
    required this.isEnabled,
    required this.onTryAnother,
    required this.onNewPrompt,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isEnabled ? 1.0 : 0.5,
      duration: const Duration(milliseconds: 200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: ActionButton(
                  onTap: isEnabled ? onNewPrompt : null,
                  title: 'New prompt'
              )),
          const SizedBox(width: 24),
          Expanded(
              child: ActionButton(
                  onTap: isEnabled ? onTryAnother : null,
                  title: 'Try another'
              )),
        ],
      ),
    );
  }
}

