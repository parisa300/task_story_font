
import 'package:equatable/equatable.dart';

class TextState extends Equatable {
  final String text;
  final double scale;

  const TextState({
    required this.text,
    required this.scale,
  });

  TextState copyWith({String? text, double? scale}) {
    return TextState(
      text: text ?? this.text,
      scale: scale ?? this.scale,
    );
  }

  @override
  List<Object?> get props => [text, scale];
}
