import 'package:dartz/dartz.dart';
import 'package:heb/core/exceptions/custom.exceptions.dart';
import 'package:heb/app/domain/entities/pokemon_response.entity.dart';
import 'package:heb/app/domain/repositories/pokemon.repository.dart';

class GetPokemonListUsecase {
  final PokemonRepository pokemonRepository;

  GetPokemonListUsecase({required this.pokemonRepository});

  Future<Either<CustomException, PokemonResponse>> execute({
    required String next,
  }) async {
    return await pokemonRepository.getPokemons(next: next);
  }
}
