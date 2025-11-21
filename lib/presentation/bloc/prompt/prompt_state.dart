import 'package:equatable/equatable.dart';

class PromptState extends Equatable {
  final String prompt;

  const PromptState({this.prompt = ''});

  bool get isValid => prompt.trim().isNotEmpty;

  PromptState copyWith({String? prompt}) {
    return PromptState(prompt: prompt ?? this.prompt);
  }

  @override
  List<Object?> get props => [prompt];
}

