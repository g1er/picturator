import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/injection_container.dart';
import 'core/theme/app_theme.dart';
import 'presentation/bloc/image_generation/image_generation_bloc.dart';
import 'presentation/bloc/prompt/prompt_bloc.dart';
import 'presentation/screens/prompt_screen.dart';

void main() {
  setupDependencyInjection();
  runApp(const PicturatorApp());
}

class PicturatorApp extends StatelessWidget {
  const PicturatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PromptBloc>(
          create: (_) => getIt<PromptBloc>(),
        ),
        BlocProvider<ImageGenerationBloc>(
          create: (_) => getIt<ImageGenerationBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Picturator',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: const PromptScreen(),
      ),
    );
  }
}

