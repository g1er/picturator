import 'package:equatable/equatable.dart';

abstract class ImageGenerationEvent extends Equatable {
  const ImageGenerationEvent();

  @override
  List<Object?> get props => [];
}

class GenerateImageEvent extends ImageGenerationEvent {
  final String prompt;

  const GenerateImageEvent(this.prompt);

  @override
  List<Object?> get props => [prompt];
}

class RetryImageEvent extends ImageGenerationEvent {
  final String prompt;

  const RetryImageEvent(this.prompt);

  @override
  List<Object?> get props => [prompt];
}

