import 'package:dartz/dartz.dart';
import 'package:heb/app/domain/entities/pokemon/pokemon_detail.entity.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:heb/app/domain/entities/pokemon/pokemon.entity.dart';
import 'package:heb/app/domain/entities/pokemon_response.entity.dart';
import 'package:heb/app/domain/entities/pokemon_detail_response.entity.dart';

import 'package:heb/app/domain/usecases/get_pokemon_list.usecase.dart';
import 'package:heb/app/domain/usecases/get_pokemon_detail.usecase.dart';

import 'package:heb/app/presentation/bloc/pokemons/pokemon.bloc.dart';
import 'package:heb/app/presentation/bloc/pokemons/pokemon.state.dart';
import 'package:heb/app/presentation/bloc/pokemons/pokemons.event.dart';

import 'pokemon_bloc_test.mocks.dart';

@GenerateMocks([
  GetPokemonListUsecase,
  GetPokemonDetailUsecase,
])
void main() {
  group('PokemonBloc', () {
    late MockGetPokemonListUsecase getPokemonList;
    late MockGetPokemonDetailUsecase getPokemonDetail;
    late PokemonBloc pokemonBloc;

    setUp(() {
      getPokemonList = MockGetPokemonListUsecase();
      getPokemonDetail = MockGetPokemonDetailUsecase();
      pokemonBloc = PokemonBloc(getPokemonList, getPokemonDetail);
    });

    tearDown(() {
      pokemonBloc.close();
    });

    test('initial state is correct', () {
      expect(pokemonBloc.state, const PokemonState());
    });

    group('Test Bloc on PokemonLoadList', () {
      blocTest<PokemonBloc, PokemonState>(
        'emits correct states when PokemonLoadList event is added and more is false',
        build: () {
          when(getPokemonList.execute(next: anyNamed('next'))).thenAnswer(
            (_) async => Right(
              PokemonResponse(
                count: 10,
                next: 'https://www.next.com',
                previous: '',
                results: List.filled(2, const Pokemon.empty()),
              ),
            ),
          );
          when(getPokemonDetail.execute(url: anyNamed('url'))).thenAnswer(
            (_) async => const Right(PokemonDetailResponse.empty()),
          );
          return pokemonBloc;
        },
        wait: const Duration(milliseconds: 100),
        act: (bloc) => bloc.add(PokemonLoadList(more: false)),
        expect: () => [
          const PokemonState(loading: true, loadingMore: false),
          PokemonState(
            loading: false,
            loadingMore: false,
            next: 'https://www.next.com',
            team: const [],
            list: List.filled(2, const Pokemon.empty()),
          ),
        ],
        verify: (bloc) {
          verify(getPokemonList.execute(next: anyNamed('next'))).called(1);
        },
      );

      blocTest<PokemonBloc, PokemonState>(
        'emits correct states when PokemonLoadList event is added and more is true',
        build: () {
          when(getPokemonList.execute(next: anyNamed('next'))).thenAnswer(
            (_) async => Right(
              PokemonResponse(
                count: 10,
                next: 'https://www.next.com',
                previous: '',
                results: List.filled(2, const Pokemon.empty()),
              ),
            ),
          );
          when(getPokemonDetail.execute(url: anyNamed('url'))).thenAnswer(
            (_) async => const Right(PokemonDetailResponse.empty()),
          );
          return pokemonBloc;
        },
        act: (bloc) => bloc.add(PokemonLoadList(more: true)),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          const PokemonState(loading: false, loadingMore: true),
          PokemonState(
            loading: false,
            loadingMore: false,
            next: 'https://www.next.com',
            team: const [],
            list: List.filled(2, const Pokemon.empty()),
          ),
        ],
        verify: (bloc) {
          verify(getPokemonList.execute(next: anyNamed('next'))).called(1);
        },
      );

      blocTest<PokemonBloc, PokemonState>(
        'should call getPokemonDetail for each pokemon got on getPokemons',
        build: () {
          when(getPokemonList.execute(next: anyNamed('next'))).thenAnswer(
            (_) async => Right(
              PokemonResponse(
                count: 10,
                next: 'https://www.next.com',
                previous: '',
                results: List.filled(2, const Pokemon.empty()),
              ),
            ),
          );
          when(getPokemonDetail.execute(url: anyNamed('url'))).thenAnswer(
            (_) async => const Right(PokemonDetailResponse.empty()),
          );
          return pokemonBloc;
        },
        act: (bloc) => bloc.add(PokemonLoadList(more: true)),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          const PokemonState(loading: false, loadingMore: true),
          PokemonState(
            loading: false,
            loadingMore: false,
            next: 'https://www.next.com',
            team: const [],
            list: List.filled(2, const Pokemon.empty()),
          ),
        ],
        verify: (bloc) {
          verify(getPokemonList.execute(next: anyNamed('next'))).called(1);
          verify(getPokemonDetail.execute(url: anyNamed('url'))).called(
            bloc.state.list.length,
          );
        },
      );
    });

    group('Test Bloc on PokemonAddToTeam', () {
      blocTest<PokemonBloc, PokemonState>(
        'should add Pokemon1 and onTeam should be true in the list on PokemonAddToTeam event',
        build: () {
          return pokemonBloc;
        },
        seed: () {
          return pokemonBloc.state.copyWith(
            list: [
              const Pokemon(
                name: 'Pokemon1',
                url: '',
                detail: PokemonDetail.empty(),
                onTeam: false,
              )
            ],
            team: [],
          );
        },
        act: (bloc) {
          bloc.add(
            PokemonAddToTeam(
              pokemon: const Pokemon(
                name: 'Pokemon1',
                url: '',
                detail: PokemonDetail.empty(),
                onTeam: false,
              ),
            ),
          );
          return bloc;
        },
        expect: () => [
          pokemonBloc.state.copyWith(
            team: [
              const Pokemon(
                name: 'Pokemon1',
                url: '',
                detail: PokemonDetail.empty(),
                onTeam: true,
              )
            ],
            list: [
              const Pokemon(
                name: 'Pokemon1',
                url: '',
                detail: PokemonDetail.empty(),
                onTeam: true,
              )
            ],
          ),
        ],
        verify: (bloc) {
          final state = bloc.state;
          expect(
            state.team.contains(const Pokemon(
              name: 'Pokemon1',
              url: '',
              detail: PokemonDetail.empty(),
              onTeam: true,
            )),
            true,
          ); // Verificar si Pokemon2 fue agregado a la lista
        },
      );
      blocTest<PokemonBloc, PokemonState>(
        'should increase pokemon at 1 team on PokemonAddToTeam event',
        build: () {
          return pokemonBloc;
        },
        seed: () {
          return pokemonBloc.state.copyWith(
            list: [
              const Pokemon(
                name: 'Pokemon1',
                url: '',
                detail: PokemonDetail.empty(),
                onTeam: false,
              )
            ],
            team: [],
          );
        },
        act: (bloc) {
          bloc.add(
            PokemonAddToTeam(
              pokemon: const Pokemon(
                name: 'Pokemon1',
                url: '',
                detail: PokemonDetail.empty(),
                onTeam: false,
              ),
            ),
          );
          return bloc;
        },
        expect: () => [
          pokemonBloc.state.copyWith(
            team: [
              const Pokemon(
                name: 'Pokemon1',
                url: '',
                detail: PokemonDetail.empty(),
                onTeam: true,
              )
            ],
            list: [
              const Pokemon(
                name: 'Pokemon1',
                url: '',
                detail: PokemonDetail.empty(),
                onTeam: true,
              )
            ],
          ),
        ],
        verify: (bloc) {
          final state = bloc.state;
          expect(
            state.team.length == 1 && state.list.length == state.team.length,
            true,
          ); // Verificar si Pokemon2 fue agregado a la lista
        },
      );

      blocTest<PokemonBloc, PokemonState>(
        'should not add the same pokemon to the on PokemonAddToTeam event',
        build: () {
          return pokemonBloc;
        },
        seed: () {
          return pokemonBloc.state.copyWith(
            list: [
              const Pokemon(
                name: 'Pokemon1',
                url: '',
                detail: PokemonDetail.empty(),
                onTeam: true,
              )
            ],
            team: [
              const Pokemon(
                name: 'Pokemon1',
                url: '',
                detail: PokemonDetail.empty(),
                onTeam: true,
              )
            ],
          );
        },
        act: (bloc) {
          bloc.add(
            PokemonAddToTeam(
              pokemon: const Pokemon(
                name: 'Pokemon1',
                url: '',
                detail: PokemonDetail.empty(),
                onTeam: true,
              ),
            ),
          );
          return bloc;
        },
        expect: () => [],
        verify: (bloc) {
          final state = bloc.state;
          expect(
            state.team.where((e) => e.name == 'Pokemon1').length,
            1,
          ); // Verificar si Pokemon2 fue agregado a la lista
        },
      );
    });

    group('Test Bloc on PokemonDeleteFromTeam', () {
      blocTest<PokemonBloc, PokemonState>(
        'should delete Pokemon1 and onTeam should be false in the list on PokemonDeleteFromTeam event',
        build: () {
          return pokemonBloc;
        },
        seed: () {
          return pokemonBloc.state.copyWith(
            list: [
              const Pokemon(
                name: 'Pokemon1',
                url: '',
                detail: PokemonDetail.empty(),
                onTeam: true,
              )
            ],
            team: [
              const Pokemon(
                name: 'Pokemon1',
                url: '',
                detail: PokemonDetail.empty(),
                onTeam: true,
              )
            ],
          );
        },
        act: (bloc) {
          bloc.add(
            PokemonDelteFromTeam(
              pokemon: const Pokemon(
                name: 'Pokemon1',
                url: '',
                detail: PokemonDetail.empty(),
                onTeam: false,
              ),
            ),
          );
          return bloc;
        },
        expect: () => [
          pokemonBloc.state.copyWith(
            team: [],
            list: [
              const Pokemon(
                name: 'Pokemon1',
                url: '',
                detail: PokemonDetail.empty(),
                onTeam: false,
              )
            ],
          ),
        ],
        verify: (bloc) {
          final state = bloc.state;
          expect(
            state.team.contains(const Pokemon(
              name: 'Pokemon1',
              url: '',
              detail: PokemonDetail.empty(),
              onTeam: true,
            )),
            false,
          ); // Verificar si Pokemon2 fue agregado a la lista
        },
      );
      blocTest<PokemonBloc, PokemonState>(
        'should decrease pokemon at 1 team on PokemonDeleteFromTeam event',
        build: () {
          return pokemonBloc;
        },
        seed: () {
          return pokemonBloc.state.copyWith(
            list: [
              const Pokemon(
                name: 'Pokemon1',
                url: '',
                detail: PokemonDetail.empty(),
                onTeam: true,
              )
            ],
            team: [
              const Pokemon(
                name: 'Pokemon1',
                url: '',
                detail: PokemonDetail.empty(),
                onTeam: true,
              )
            ],
          );
        },
        act: (bloc) {
          bloc.add(
            PokemonDelteFromTeam(
              pokemon: const Pokemon(
                name: 'Pokemon1',
                url: '',
                detail: PokemonDetail.empty(),
                onTeam: false,
              ),
            ),
          );
          return bloc;
        },
        expect: () => [
          pokemonBloc.state.copyWith(
            team: [],
            list: [
              const Pokemon(
                name: 'Pokemon1',
                url: '',
                detail: PokemonDetail.empty(),
                onTeam: false,
              )
            ],
          ),
        ],
        verify: (bloc) {
          final state = bloc.state;
          expect(
            state.team.isEmpty && state.list.length > state.team.length,
            true,
          ); // Verificar si Pokemon2 fue agregado a la lista
        },
      );
    });
  });
}
