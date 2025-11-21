import 'package:flutter_bloc/flutter_bloc.dart';
import 'prompt_event.dart';
import 'prompt_state.dart';

class PromptBloc extends Bloc<PromptEvent, PromptState> {
  PromptBloc() : super(const PromptState()) {
    on<UpdatePromptEvent>(_onUpdatePrompt);
    on<ClearPromptEvent>(_onClearPrompt);
  }

  void _onUpdatePrompt(
    UpdatePromptEvent event,
    Emitter<PromptState> emit,
  ) {
    emit(state.copyWith(prompt: event.prompt));
  }

  void _onClearPrompt(
    ClearPromptEvent event,
    Emitter<PromptState> emit,
  ) {
    emit(const PromptState());
  }
}

