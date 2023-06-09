import 'package:dartz/dartz.dart';
import 'package:heb/app/domain/entities/pokemon_detail_response.entity.dart';
import 'package:heb/app/domain/entities/sprites/sprite.entity.dart';
import 'package:heb/app/domain/entities/types/type.entity.dart';
import 'package:heb/app/domain/usecases/get_pokemon_detail.usecase.dart';
import 'package:heb/core/exceptions/custom.exceptions.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../test_hepers/test_hepers.mocks.dart';

import 'package:heb/app/domain/entities/pokemon/pokemon.entity.dart';
import 'package:heb/app/domain/entities/pokemon/pokemon_detail.entity.dart';
import 'package:heb/app/domain/entities/pokemon_response.entity.dart';

import 'package:heb/app/domain/usecases/get_pokemon_list.usecase.dart';

void main() {
  late MockPokemonRepository mockPokemonRepository;
  late GetPokemonListUsecase usecaseList;
  late GetPokemonDetailUsecase usecaseDetail;

  setUp(() {
    mockPokemonRepository = MockPokemonRepository();
    usecaseList = GetPokemonListUsecase(
      pokemonRepository: mockPokemonRepository,
    );
    usecaseDetail = GetPokemonDetailUsecase(
      pokemonRepository: mockPokemonRepository,
    );
  });

  const response = PokemonResponse(
    count: 0,
    next: '',
    previous: '',
    results: [
      Pokemon(
        name: 'pokemon1',
        url: 'url',
        onTeam: false,
        detail: PokemonDetail.empty(),
      ),
      Pokemon(
        name: 'pokemon2',
        url: 'url',
        onTeam: false,
        detail: PokemonDetail.empty(),
      )
    ],
  );

  const differentResponse = PokemonResponse(
    count: 0,
    next: '',
    previous: '',
    results: [
      Pokemon(
        name: 'pokemon3',
        url: 'url',
        onTeam: false,
        detail: PokemonDetail.empty(),
      ),
      Pokemon(
        name: 'pokemon4',
        url: 'url',
        onTeam: false,
        detail: PokemonDetail.empty(),
      )
    ],
  );

  const pokemonDeail1 = PokemonDetailResponse(
    sprite: Sprite.empty(),
    types: [],
  );

  test(
    'should get a PokemonResponse from the repository',
    () async {
      // arrange
      when(mockPokemonRepository.getPokemons(next: ''))
          .thenAnswer((_) async => const Right(response));
      // act
      final result = await usecaseList.execute(next: '');
      // assert
      expect(result, equals(const Right(response)));
    },
  );

  test(
    'should get a Different PokemonResponse from the repository when getPokemons() receive an url',
    () async {
      // arrange
      when(mockPokemonRepository.getPokemons(next: ''))
          .thenAnswer((_) async => const Right(response));
      when(mockPokemonRepository.getPokemons(next: 'url'))
          .thenAnswer((_) async => const Right(differentResponse));
      final resultWithoutUrl = await usecaseList.execute(next: '');
      final resultWithUrl = await usecaseList.execute(next: 'url');
      // assert
      expect(resultWithoutUrl, equals(const Right(response)));
      expect(resultWithUrl, equals(const Right(differentResponse)));
    },
  );

  test(
      'should call getPokemonDetail for each pokemon after get the pokemon list',
      () async {
    // Define el resultado simulado de getPokemons
    when(mockPokemonRepository.getPokemons(next: ''))
        .thenAnswer((_) async => const Right(response));

    when(mockPokemonRepository.getPokemonDetail(url: anyNamed('url')))
        .thenAnswer((_) async => const Right(pokemonDeail1));

    // Llama al método getPokemons
    final result = await usecaseList.execute(next: '');
    final details = await usecaseDetail.execute(url: '');

    // Verifica que se haya llamado a getPokemonDetail para cada pokemon en la lista
    verify(usecaseDetail.execute(url: '')).called(
      result.length(),
    );

    // Verifica que el resultado sea exitoso (Right)
    expect(details, isA<Right<CustomException, PokemonDetailResponse>>());
  });
}
