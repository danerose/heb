import 'package:flutter_test/flutter_test.dart';
import 'package:heb/app/domain/entities/sprites/sprite.entity.dart';
import 'package:heb/app/domain/entities/pokemon/pokemon_detail.entity.dart';

void main() {
  group('PokemonDetail', () {
    test('should return correct empty PokemonDetail entity', () {
      // arrange & act
      const pokemonDetail = PokemonDetail.empty();
      // assert
      expect(pokemonDetail.sprite, const Sprite.empty());
      expect(pokemonDetail.type, const []);
    });
  });
}
