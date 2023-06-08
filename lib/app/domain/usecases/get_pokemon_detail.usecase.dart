import 'package:dartz/dartz.dart';
import 'package:heb/core/exceptions/custom.exceptions.dart';
import 'package:heb/app/domain/repositories/pokemon.repository.dart';
import 'package:heb/app/domain/entities/pokemon_detail_response.entity.dart';

class GetPokemonDetailUsecase {
  final PokemonRepository pokemonRepository;

  GetPokemonDetailUsecase({required this.pokemonRepository});

  Future<Either<CustomException, PokemonDetailResponse>> execute({
    required String url,
  }) async {
    return await pokemonRepository.getPokemonDetail(url: url);
  }
}
