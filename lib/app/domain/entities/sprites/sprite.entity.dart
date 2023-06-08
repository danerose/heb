import 'package:equatable/equatable.dart';

class Sprite extends Equatable {
  final String back;
  final String front;

  const Sprite({required this.back, required this.front});

  const Sprite.empty()
      : back = '',
        front = '';

  @override
  List<Object?> get props => [back, front];
}
