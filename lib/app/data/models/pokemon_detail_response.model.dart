import 'package:equatable/equatable.dart';
import 'package:heb/core/utils/validators.util.dart';

import 'package:heb/app/data/models/types/type.model.dart';
import 'package:heb/app/data/models/sprites/sprite.model.dart';

import 'package:heb/app/domain/entities/types/type.entity.dart';
import 'package:heb/app/domain/entities/pokemon_detail_response.entity.dart';

class PokemonDetailResponseModel extends Equatable {
  final SpriteModel sprite;
  final List<TypeModel> types;

  const PokemonDetailResponseModel({
    required this.sprite,
    required this.types,
  });

  factory PokemonDetailResponseModel.fromJson(Map<String, dynamic>? json) {
    return PokemonDetailResponseModel(
      sprite: SpriteModel.fromJson(
        ValidatorUtils.containsKey(json, 'sprites', null),
      ),
      types: List<TypeModel>.from(
        ValidatorUtils.containsKey(json, 'types', []).map(
          (e) => TypeModel.fromJson(e),
        ),
      ),
    );
  }

  PokemonDetailResponse toEntity() {
    return PokemonDetailResponse(
      sprite: sprite.toEntity(),
      types: List<PokType>.from(types.map((e) => e.toEntity())),
    );
  }

  @override
  List<Object?> get props => [sprite, types];
}
