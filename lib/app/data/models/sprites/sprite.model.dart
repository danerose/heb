import 'package:equatable/equatable.dart';
import 'package:heb/core/utils/validators.util.dart';
import 'package:heb/app/domain/entities/sprites/sprite.entity.dart';

class SpriteModel extends Equatable {
  const SpriteModel({
    required this.back,
    required this.front,
  });

  final String back;
  final String front;

  factory SpriteModel.fromJson(Map<String, dynamic>? json) {
    return SpriteModel(
      back: ValidatorUtils.containsKey<String>(json, 'back_default', ''),
      front: ValidatorUtils.containsKey<String>(json, 'front_default', ''),
    );
  }

  Sprite toEntity() {
    return Sprite(
      front: front,
      back: back,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'front_default': front,
      'back_default': back,
    };
  }

  @override
  List<Object?> get props => [front, back];
}
