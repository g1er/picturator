import 'package:equatable/equatable.dart';

abstract class PromptEvent extends Equatable {
  const PromptEvent();

  @override
  List<Object?> get props => [];
}

class UpdatePromptEvent extends PromptEvent {
  final String prompt;

  const UpdatePromptEvent(this.prompt);

  @override
  List<Object?> get props => [prompt];
}

class ClearPromptEvent extends PromptEvent {
  const ClearPromptEvent();
}

