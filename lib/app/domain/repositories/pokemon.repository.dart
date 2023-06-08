import 'package:dartz/dartz.dart';
import 'package:heb/core/exceptions/custom.exceptions.dart';

import 'package:heb/app/domain/entities/pokemon_response.entity.dart';
import 'package:heb/app/domain/entities/pokemon_detail_response.entity.dart';

abstract class PokemonRepository {
  Future<Either<CustomException, PokemonResponse>> getPokemons();
  Future<Either<CustomException, PokemonDetailResponse>> getPokemonDetail({
    required String url,
  });
}
