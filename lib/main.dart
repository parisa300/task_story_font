import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/render_text/presentation/bloc/text_cubit.dart';
import 'features/render_text/presentation/screen/text_render_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TextCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TextRenderScreen(),
      ),
    );
  }
}







