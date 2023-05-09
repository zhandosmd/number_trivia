import 'package:equatable/equatable.dart';

class NumberTrivia extends Equatable{ // Equatable to compare objects with its value, not reference
  final String text;
  final int number;

  const NumberTrivia({
    required this.text,
    required this.number,
  });

  @override
  List<Object> get props => [text, number];
}