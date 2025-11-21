import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/prompt/prompt_bloc.dart';
import '../bloc/prompt/prompt_event.dart';
import '../bloc/prompt/prompt_state.dart';
import '../widgets/prompt_text_field.dart';
import '../widgets/generate_button.dart';
import 'generation_screen.dart';

class PromptScreen extends StatefulWidget {
  const PromptScreen({super.key});

  @override
  State<PromptScreen> createState() => _PromptScreenState();
}

class _PromptScreenState extends State<PromptScreen> {
  late final TextEditingController _controller;
  late final PromptBloc _promptBloc;

  @override
  void initState() {
    super.initState();
    _promptBloc = context.read<PromptBloc>();
    _controller = TextEditingController();
    
    final currentPrompt = _promptBloc.state.prompt;
    if (currentPrompt.isNotEmpty) {
      _controller.text = currentPrompt;
    }
    
    _controller.addListener(() {
      _promptBloc.add(UpdatePromptEvent(_controller.text));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onGeneratePressed(String prompt) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const GenerationScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<PromptBloc, PromptState>(
            builder: (context, state) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PromptTextField(
                        controller: _controller,
                        onChanged: (value) {
                          _promptBloc.add(UpdatePromptEvent(value));
                        },
                      ),
                      const SizedBox(height: 24),
                      GenerateButton(
                        isEnabled: state.isValid,
                        onPressed: () => _onGeneratePressed(state.prompt),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

