import 'package:equatable/equatable.dart';
import 'package:heb/core/utils/validators.util.dart';

import 'package:heb/app/data/models/pokemon/pokemon.model.dart';

import 'package:heb/app/domain/entities/pokemon/pokemon.entity.dart';
import 'package:heb/app/domain/entities/pokemon_response.entity.dart';

class PokemonResponseModel extends Equatable {
  final int count;
  final String next;
  final String previous;
  final List<PokemonModel> results;

  const PokemonResponseModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory PokemonResponseModel.fromJson(Map<String, dynamic>? json) {
    return PokemonResponseModel(
      count: ValidatorUtils.containsKey<int>(json, 'count', 0),
      next: ValidatorUtils.containsKey<String>(json, 'next', ''),
      previous: ValidatorUtils.containsKey<String>(json, 'previous', ''),
      results: List<PokemonModel>.from(
        ValidatorUtils.containsKey(json, 'results', []).map(
          (e) => PokemonModel.fromJson(e),
        ),
      ),
    );
  }

  PokemonResponse toEntity() {
    return PokemonResponse(
      count: count,
      next: next,
      previous: previous,
      results: List<Pokemon>.from(results.map((e) => e.toEntity())),
    );
  }

  @override
  List<Object?> get props => [count, next, previous, results];
}
