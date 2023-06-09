import 'package:flutter_test/flutter_test.dart';
import 'package:heb/app/domain/entities/pokemon/pokemon.entity.dart';
import 'package:heb/app/domain/entities/pokemon/pokemon_detail.entity.dart';
import 'package:heb/app/domain/entities/sprites/sprite.entity.dart';
import 'package:heb/app/domain/entities/types/type.entity.dart';
import 'package:heb/app/domain/entities/types/type_detail.entity.dart';

void main() {
  group('Pokemon', () {
    test('should return correct empty Pokemon entity', () {
      // arrange & act
      final pokemon = Pokemon.empty();

      // assert
      expect(pokemon.name, '');
      expect(pokemon.url, '');
      expect(pokemon.onTeam, false);
      expect(pokemon.detail, const PokemonDetail.empty());
    });

    test('should return correct copied Pokemon entity', () {
      // arrange
      const pokemon = Pokemon(
        name: 'Pikachu',
        url: 'https://example.com',
        onTeam: false,
        detail: PokemonDetail.empty(),
      );

      // act
      final copiedPokemon = pokemon.copyWith(onTeam: true);

      // assert
      expect(copiedPokemon.name, 'Pikachu');
      expect(copiedPokemon.url, 'https://example.com');
      expect(copiedPokemon.onTeam, true);
      expect(copiedPokemon.detail, const PokemonDetail.empty());
    });

    test('should return correct Pokemon entity with updated detail', () {
      // arrange
      const oldDetail = PokemonDetail(
        sprite: Sprite.empty(),
        type: [],
      );
      const newDetail = PokemonDetail(
        sprite: Sprite(back: 'back.png', front: 'front.png'),
        type: [
          PokType(
            slot: 1,
            detail: TypeDetail(name: 'Electric', url: 'https://example.com'),
          )
        ],
      );
      const pokemon = Pokemon(
        name: 'Pikachu',
        url: 'https://example.com',
        onTeam: false,
        detail: oldDetail,
      );

      // act
      final updatedPokemon = pokemon.copyWith(detail: newDetail);

      // assert
      expect(updatedPokemon.name, 'Pikachu');
      expect(updatedPokemon.url, 'https://example.com');
      expect(updatedPokemon.onTeam, false);
      expect(updatedPokemon.detail.sprite.back, 'back.png');
      expect(updatedPokemon.detail.sprite.front, 'front.png');
      expect(updatedPokemon.detail.type.length, 1);
      expect(updatedPokemon.detail.type[0].slot, 1);
      expect(updatedPokemon.detail.type[0].detail.name, 'Electric');
      expect(updatedPokemon.detail.type[0].detail.url, 'https://example.com');
    });

    test('should return correct list of props', () {
      // arrange
      const pokemon = Pokemon(
        name: 'Pikachu',
        url: 'https://example.com',
        onTeam: false,
        detail: PokemonDetail.empty(),
      );

      // act
      final props = pokemon.props;

      // assert
      expect(props, ['Pikachu', false, const PokemonDetail.empty()]);
    });
  });
}
