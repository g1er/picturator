import '../entities/image_result.dart';

abstract class ImageRepository {
  Future<ImageResult> generateImage(String prompt);
}

