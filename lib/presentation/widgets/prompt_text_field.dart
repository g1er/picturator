import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';

class PromptTextField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const PromptTextField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      minLines: AppConstants.minLines,
      maxLines: AppConstants.maxLines,
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        hintText: 'Describe what you want to see…',
      ),
      style: const TextStyle(
        fontSize: 16,
        height: 1.5,
      ),
    );
  }
}

