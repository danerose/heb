import 'package:dartz/dartz.dart';
import 'package:heb/app/domain/entities/pokemon_detail_response.entity.dart';
import 'package:heb/core/exceptions/custom.exceptions.dart';
import 'package:heb/app/domain/entities/pokemon_response.entity.dart';
import 'package:heb/app/domain/repositories/pokemon.repository.dart';
import 'package:heb/app/data/datasources/remote/interfaces/pokemon.remote.source.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteSource pokemonRemoteSource;

  const PokemonRepositoryImpl({required this.pokemonRemoteSource});

  @override
  Future<Either<CustomException, PokemonResponse>> getPokemons({
    required String next,
  }) async {
    try {
      final res = await pokemonRemoteSource.getPokemons(next: next);
      return Right(res.toEntity());
    } on CustomException catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(CustomException.unknown(e: e, stack: s));
    }
  }

  @override
  Future<Either<CustomException, PokemonDetailResponse>> getPokemonDetail({
    required String url,
  }) async {
    try {
      final res = await pokemonRemoteSource.getPokemonDetail(url: url);
      return Right(res.toEntity());
    } on CustomException catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(CustomException.unknown(e: e, stack: s));
    }
  }
}
