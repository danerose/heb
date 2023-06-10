import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heb/app/data/datasources/remote/implementations/pokemon.remote.source.impl.dart';
import 'package:heb/app/data/models/pokemon_detail_response.model.dart';
import 'package:heb/app/data/models/pokemon_response.model.dart';
import 'package:mockito/mockito.dart';

import '../../test_helpers/dummy/json_reader_helper.dart';
import '../../test_helpers/test_hepers.mocks.dart';

void main() {
  late MockHttpClient mockHttpService;
  late PokemonRemoteSourceImpl pokemonRemoteSource;

  setUp(() {
    mockHttpService = MockHttpClient();
    pokemonRemoteSource = PokemonRemoteSourceImpl(httpService: mockHttpService);
  });

  group('getPokemons', () {
    test('should return a PokemonResponseModel when successful', () async {
      // Arrange
      final response = json.decode(readPokemonListJson());
      final expectedModel = PokemonResponseModel.fromJson(response);
      when(mockHttpService.get(any, options: anyNamed('options')))
          .thenAnswer((_) async => Response(
                data: response,
                requestOptions: RequestOptions(),
              ));

      // Act
      final result = await pokemonRemoteSource.getPokemons(next: '');

      // Assert
      expect(result, equals(expectedModel));
      verify(mockHttpService.get(any, options: anyNamed('options'))).called(1);
    });

    test('should throw an exception when an error occurs', () async {
      // Arrange
      when(mockHttpService.get(any, options: anyNamed('options')))
          .thenThrow(Exception());

      // Act & Assert
      expect(
        () => pokemonRemoteSource.getPokemons(next: ''),
        throwsA(isInstanceOf<Exception>()),
      );
      verify(mockHttpService.get(any, options: anyNamed('options'))).called(1);
    });
  });

  group('getPokemonDetail', () {
    test('should return a PokemonDetailResponseModel when successful',
        () async {
      // Arrange
      final response = json.decode(readPokemonDetailJson());

      final expectedModel = PokemonDetailResponseModel.fromJson(response);

      when(mockHttpService.get(any, options: anyNamed('options'))).thenAnswer(
        (_) async => Response(
          data: response,
          requestOptions: RequestOptions(),
        ),
      );

      // Act
      final result = await pokemonRemoteSource.getPokemonDetail(url: '');

      // Assert
      expect(result, equals(expectedModel));
      verify(mockHttpService.get(any, options: anyNamed('options'))).called(1);
    });

    test('should throw an exception when an error occurs', () async {
      // Arrange
      when(mockHttpService.get(any, options: anyNamed('options')))
          .thenThrow(Exception());

      // Act & Assert
      expect(
        () => pokemonRemoteSource.getPokemonDetail(url: ''),
        throwsA(isInstanceOf<Exception>()),
      );
      verify(mockHttpService.get(any, options: anyNamed('options'))).called(1);
    });
  });
}
