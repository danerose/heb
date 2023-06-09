import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_test/flutter_test.dart';
import '../../test_hepers/test_hepers.mocks.dart';

import 'package:heb/app/domain/entities/sprites/sprite.entity.dart';
import 'package:heb/app/domain/entities/pokemon_detail_response.entity.dart';

import 'package:heb/app/domain/usecases/get_pokemon_detail.usecase.dart';

void main() {
  late MockPokemonRepository mockPokemonRepository;
  late GetPokemonDetailUsecase usecaseDetail;

  setUp(() {
    mockPokemonRepository = MockPokemonRepository();
    usecaseDetail = GetPokemonDetailUsecase(
      pokemonRepository: mockPokemonRepository,
    );
  });

  const pokemonDeail = PokemonDetailResponse(
    sprite: Sprite.empty(),
    types: [],
  );

  test(
    'should get a PokemonDetailResponse from the repository',
    () async {
      // arrange
      when(mockPokemonRepository.getPokemonDetail(url: ''))
          .thenAnswer((_) async => const Right(pokemonDeail));
      // act
      final result = await usecaseDetail.execute(url: '');
      // assert
      expect(result, equals(const Right(pokemonDeail)));
    },
  );
}