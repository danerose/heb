import 'package:heb/app/data/models/pokemon_response.model.dart';
import 'package:heb/app/data/models/pokemon_detail_response.model.dart';

abstract class PokemonRemoteSource {
  Future<PokemonResponseModel> getPokemons();
  Future<PokemonDetailResponseModel> getPokemonDetail({required String url});
}
