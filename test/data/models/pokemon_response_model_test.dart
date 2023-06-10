import 'package:flutter_test/flutter_test.dart';
import 'package:heb/app/data/models/pokemon/pokemon.model.dart';
import 'package:heb/app/data/models/pokemon_response.model.dart';

void main() {
  group('PokemonResponseModel', () {
    test('should return correct PokemonResponse entity', () {
      // arrange
      const pokemonModel = PokemonModel(
        name: 'Pikachu',
        url: 'https://example.com',
      );

      const responseModel = PokemonResponseModel(
        count: 1,
        next: '',
        previous: '',
        results: [pokemonModel],
      );

      // act
      final responseEntity = responseModel.toEntity();

      // assert
      expect(responseEntity.count, 1);
      expect(responseEntity.next, '');
      expect(responseEntity.previous, '');
      expect(responseEntity.results.length, 1);
      expect(responseEntity.results[0].name, 'Pikachu');
      expect(responseEntity.results[0].url, 'https://example.com');
    });
  });
}
