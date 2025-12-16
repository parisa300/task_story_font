import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../moment/screen/moment_screen.dart';
import '../bloc/text_cubit.dart';
import '../bloc/text_state.dart';
import '../widgets/fancy_text_widget.dart';

class TextRenderScreen extends StatelessWidget {
  const TextRenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const MomentsScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text('Moment'),
                ),
              ),


              Expanded(
                child: BlocBuilder<TextCubit, TextState>(
                  builder: (context, state) {
                    return GestureDetector(
                      onScaleUpdate: (details) {
                        context.read<TextCubit>().updateScale(details.scale);
                      },
                      child: FancyTextWidget(
                        text: state.text,
                        scale: state.scale,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  onChanged: (value) =>
                      context.read<TextCubit>().updateText(value),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'متن را وارد کنید',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
