import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/image_result.dart';
import '../../../domain/repositories/image_repository.dart';
import 'image_generation_event.dart';
import 'image_generation_state.dart';

class ImageGenerationBloc extends Bloc<ImageGenerationEvent, ImageGenerationState> {
  final ImageRepository imageRepository;

  ImageGenerationBloc({required this.imageRepository})
      : super(const ImageGenerationState()) {
    on<GenerateImageEvent>(_onGenerateImage);
    on<RetryImageEvent>(_onRetryImage);
  }

  Future<void> _onGenerateImage(
    GenerateImageEvent event,
    Emitter<ImageGenerationState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, result: null));

    try {
      final result = await imageRepository.generateImage(event.prompt);
      emit(state.copyWith(isLoading: false, result: result));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        result: const ImageResult(
          errorMessage: 'An unexpected error occurred. Please try again.',
        ),
      ));
    }
  }

  Future<void> _onRetryImage(
    RetryImageEvent event,
    Emitter<ImageGenerationState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, result: null));

    try {
      final result = await imageRepository.generateImage(event.prompt);
      emit(state.copyWith(isLoading: false, result: result));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        result: const ImageResult(
          errorMessage: 'An unexpected error occurred. Please try again.',
        ),
      ));
    }
  }
}

