import 'package:heb/app/data/models/pokemon_response.model.dart';

abstract class PokemonRemoteSource {
  Future<PokemonResponseModel> getPokemons();
}
