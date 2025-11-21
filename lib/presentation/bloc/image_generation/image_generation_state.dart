import 'package:equatable/equatable.dart';
import '../../../domain/entities/image_result.dart';

class ImageGenerationState extends Equatable {
  final bool isLoading;
  final ImageResult? result;

  const ImageGenerationState({
    this.isLoading = false,
    this.result,
  });

  ImageGenerationState copyWith({
    bool? isLoading,
    ImageResult? result,
  }) {
    return ImageGenerationState(
      isLoading: isLoading ?? this.isLoading,
      result: result ?? this.result,
    );
  }

  @override
  List<Object?> get props => [isLoading, result];
}

