import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/app_constants.dart';
import '../bloc/image_generation/image_generation_bloc.dart';
import '../bloc/image_generation/image_generation_event.dart';
import '../bloc/image_generation/image_generation_state.dart';
import '../bloc/prompt/prompt_bloc.dart';
import '../widgets/image_container.dart';
import '../widgets/action_buttons.dart';
import '../widgets/retry_button.dart';

class GenerationScreen extends StatefulWidget {
  const GenerationScreen({super.key});

  @override
  State<GenerationScreen> createState() => _GenerationScreenState();
}

class _GenerationScreenState extends State<GenerationScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final prompt = context.read<PromptBloc>().state.prompt;
      if (prompt.isNotEmpty) {
        context.read<ImageGenerationBloc>().add(GenerateImageEvent(prompt));
      }
    });
  }

  void _onTryAnother() {
    final prompt = context.read<PromptBloc>().state.prompt;
    context.read<ImageGenerationBloc>().add(GenerateImageEvent(prompt));
  }

  void _onNewPrompt() {
    Navigator.of(context).pop();
  }

  void _onRetry() {
    final prompt = context.read<PromptBloc>().state.prompt;
    context.read<ImageGenerationBloc>().add(RetryImageEvent(prompt));
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final imageContainerHeight = screenHeight * AppConstants.imageContainerHeightPercent;

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ImageGenerationBloc, ImageGenerationState>(
          builder: (context, state) {
            final isLoading = state.isLoading;
            final result = state.result;
            final showError = result != null && result.isError;
            final showButtons = !showError && result != null && result.isSuccess;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: imageContainerHeight,
                      child: ImageContainer(
                        result: result,
                        isLoading: isLoading,
                      ),
                    ),
                    const SizedBox(height: 24),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: showError && !isLoading
                          ? RetryButton(
                              key: const ValueKey('retry'),
                              onRetry: _onRetry,
                            )
                          : showButtons
                              ? ActionButtons(
                                  key: const ValueKey('actions'),
                                  isEnabled: !isLoading,
                                  onTryAnother: _onTryAnother,
                                  onNewPrompt: _onNewPrompt,
                                )
                              : const SizedBox.shrink(key: ValueKey('empty')),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

