import 'package:equatable/equatable.dart';
import 'package:heb/app/domain/entities/pokemon/pokemon_detail.entity.dart';
import 'package:heb/core/utils/validators.util.dart';
import 'package:heb/app/domain/entities/pokemon/pokemon.entity.dart';

class PokemonModel extends Equatable {
  const PokemonModel({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory PokemonModel.fromJson(Map<String, dynamic>? json) {
    return PokemonModel(
      name: ValidatorUtils.containsKey<String>(json, 'name', ''),
      url: ValidatorUtils.containsKey<String>(json, 'url', ''),
    );
  }

  Pokemon toEntity() {
    return Pokemon(
      name: name,
      url: url,
      detail: const PokemonDetail.empty(),
      loading: true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }

  @override
  List<Object?> get props => [name, url];
}
