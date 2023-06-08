import 'package:equatable/equatable.dart';
import 'package:heb/app/domain/entities/types/type.entity.dart';
import 'package:heb/app/domain/entities/sprites/sprite.entity.dart';

class PokemonDetail extends Equatable {
  final Sprite sprite;
  final List<PokType> type;

  const PokemonDetail({
    required this.sprite,
    required this.type,
  });

  const PokemonDetail.empty()
      : sprite = const Sprite.empty(),
        type = const [];

  @override
  List<Object?> get props => [sprite, type];
}
