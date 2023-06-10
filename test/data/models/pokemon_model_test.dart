import 'package:flutter_test/flutter_test.dart';
import 'package:heb/app/data/models/pokemon/pokemon.model.dart';

import 'package:heb/app/domain/entities/pokemon/pokemon_detail.entity.dart';

void main() {
  group('PokemonModel', () {
    test('should return correct Pokemon entity when Pokemon Detail is Empty',
        () {
      // arrange
      const pokemonModel = PokemonModel(
        name: 'Pikachu',
        url: 'https://example.com',
      );
      // act
      final pokemonEntity = pokemonModel.toEntity();
      // assert
      expect(pokemonEntity.name, 'Pikachu');
      expect(pokemonEntity.url, 'https://example.com');
      expect(pokemonEntity.onTeam, false);
      expect(pokemonEntity.detail, const PokemonDetail.empty());
    });

    test('should return correct JSON representation', () {
      // arrange
      const pokemonModel = PokemonModel(
        name: 'Pikachu',
        url: 'https://example.com',
      );
      // act
      final json = pokemonModel.toJson();
      // assert
      expect(json, {'name': 'Pikachu', 'url': 'https://example.com'});
    });
  });
}
