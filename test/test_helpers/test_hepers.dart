import 'package:mockito/annotations.dart';
import 'package:heb/core/services/network/http.service.dart';
import 'package:heb/app/domain/repositories/pokemon.repository.dart';
import 'package:heb/app/data/datasources/remote/interfaces/pokemon.remote.source.dart';

@GenerateMocks(
  [
    PokemonRepository,
    PokemonRemoteSource,
  ],
  customMocks: [MockSpec<HttpService>(as: #MockHttpClient)],
)
void main() {}
