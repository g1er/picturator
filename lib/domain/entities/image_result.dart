import 'package:equatable/equatable.dart';

class ImageResult extends Equatable {
  final String? imageUrl;
  final String? errorMessage;

  const ImageResult({
    this.imageUrl,
    this.errorMessage,
  });

  bool get isSuccess => imageUrl != null && errorMessage == null;
  bool get isError => errorMessage != null;

  @override
  List<Object?> get props => [imageUrl, errorMessage];
}

