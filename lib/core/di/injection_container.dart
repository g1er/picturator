import 'package:get_it/get_it.dart';
import '../../data/repositories/image_repository_impl.dart';
import '../../domain/repositories/image_repository.dart';
import '../../presentation/bloc/image_generation/image_generation_bloc.dart';
import '../../presentation/bloc/prompt/prompt_bloc.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  // Repositories
  getIt.registerLazySingleton<ImageRepository>(
    () => ImageRepositoryImpl(),
  );

  // BLoCs
  getIt.registerFactory<PromptBloc>(
    () => PromptBloc(),
  );

  getIt.registerFactory<ImageGenerationBloc>(
    () => ImageGenerationBloc(imageRepository: getIt<ImageRepository>()),
  );
}

