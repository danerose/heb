import 'package:dio/dio.dart';
import 'package:heb/app/domain/repositories/pokemon.repository.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [
    PokemonRepository,
  ],
  customMocks: [MockSpec<Dio>(as: #MockHttpClient)],
)
void main() {}
