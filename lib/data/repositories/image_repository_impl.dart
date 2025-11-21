import 'dart:async';
import 'dart:math';
import '../../core/constants/app_constants.dart';
import '../../domain/entities/image_result.dart';
import '../../domain/repositories/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  int _callCount = 0;

  @override
  Future<ImageResult> generateImage(String prompt) async {
    _callCount++;
    
    final delay = AppConstants.minDelaySeconds +
        Random().nextInt(AppConstants.maxDelaySeconds - AppConstants.minDelaySeconds + 1);
    await Future.delayed(Duration(seconds: delay));

    if (_callCount % AppConstants.errorFrequency == 0) {
      return const ImageResult(
        errorMessage: 'Failed to generate image. Please try again.',
      );
    }

    final imageIndex = Random().nextInt(AppConstants.imageCount) + 1;
    final imageUrl = 'assets/images/image_$imageIndex.jpg';

    return ImageResult(imageUrl: imageUrl);
  }
}

