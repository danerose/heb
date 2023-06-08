import 'package:heb/app/data/models/pokemon_detail_response.model.dart';
import 'package:heb/core/services/network/http.service.dart';
import 'package:heb/core/constants/pokemon_api.constants.dart';
import 'package:heb/app/data/models/pokemon_response.model.dart';
import 'package:heb/app/data/datasources/remote/interfaces/pokemon.remote.source.dart';

class PokemonRemoteSourceImpl implements PokemonRemoteSource {
  final HttpService httpService;

  const PokemonRemoteSourceImpl({
    required this.httpService,
  });

  @override
  Future<PokemonResponseModel> getPokemons() async {
    try {
      final res = await httpService.get(
        PokemonApiConstants.pokemon,
      );
      return PokemonResponseModel.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PokemonDetailResponseModel> getPokemonDetail({
    required String url,
  }) async {
    try {
      final res = await httpService.get(
        PokemonApiConstants.pokemonDetail(url),
      );
      return PokemonDetailResponseModel.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }
}
