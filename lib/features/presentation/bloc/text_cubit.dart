

import 'package:flutter_bloc/flutter_bloc.dart';
import 'text_state.dart';

class TextCubit extends Cubit<TextState> {
  TextCubit() : super(const TextState(text: 'سلام', scale: 1.0));

  void updateText(String newText) {
    emit(state.copyWith(text: newText.isEmpty ? ' ' : newText));
  }

  void updateScale(double scaleFactor) {
    emit(state.copyWith(scale: (state.scale * scaleFactor).clamp(0.5, 3.0)));
  }
}
