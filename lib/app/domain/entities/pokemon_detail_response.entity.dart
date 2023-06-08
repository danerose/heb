import 'package:equatable/equatable.dart';
import 'package:heb/app/domain/entities/types/type.entity.dart';
import 'package:heb/app/domain/entities/sprites/sprite.entity.dart';

class PokemonDetailResponse extends Equatable {
  final Sprite sprite;
  final List<PokType> types;

  const PokemonDetailResponse({
    required this.sprite,
    required this.types,
  });

  const PokemonDetailResponse.empty()
      : sprite = const Sprite.empty(),
        types = const [];

  @override
  List<Object?> get props => [sprite, types];
}
