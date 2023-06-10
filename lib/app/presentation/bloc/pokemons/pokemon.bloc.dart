import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:heb/core/exceptions/custom.exceptions.dart';

import 'package:heb/app/domain/entities/pokemon/pokemon.entity.dart';
import 'package:heb/app/domain/entities/pokemon_response.entity.dart';
import 'package:heb/app/domain/entities/pokemon/pokemon_detail.entity.dart';
import 'package:heb/app/domain/entities/pokemon_detail_response.entity.dart';

import 'package:heb/app/domain/usecases/get_pokemon_list.usecase.dart';
import 'package:heb/app/domain/usecases/get_pokemon_detail.usecase.dart';

import 'package:heb/app/presentation/bloc/pokemons/pokemon.state.dart';
import 'package:heb/app/presentation/bloc/pokemons/pokemons.event.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final GetPokemonListUsecase _getPokemonList;
  final GetPokemonDetailUsecase _getPokemonDetail;
  PokemonBloc(
    this._getPokemonList,
    this._getPokemonDetail,
  ) : super(const PokemonState()) {
    on<PokemonLoadList>(_onLoad);
    on<PokemonAddToTeam>(_onAddToTeam);
    on<PokemonDelteFromTeam>(_onDeleteFromTeam);
  }

  Future<void> _onLoad(
    PokemonLoadList event,
    Emitter<PokemonState> emit,
  ) async {
    emit(state.copyWith(loading: !event.more, loadingMore: event.more));
    final res = await _getPokemonList.execute(next: state.next);
    late List<Pokemon> list = [];
    late String next = '';
    res.fold((CustomException l) {
      emit(state.copyWith(loading: false, loadingMore: false));
    }, (PokemonResponse r) {
      list = r.results;
      next = r.next;
    });
    final d = await Future.wait<Either<CustomException, PokemonDetailResponse>>(
      List.from(list.map((e) => _getPokemonDetail.execute(url: e.url))),
    );
    list = List.generate(
      list.length,
      (index) => list[index].copyWith(
        detail: d[index].fold(
          (l) => const PokemonDetail.empty(),
          (r) => PokemonDetail(sprite: r.sprite, type: r.types),
        ),
      ),
    );
    emit(state.copyWith(
      loading: false,
      loadingMore: false,
      next: next,
      list: [...state.list, ...list],
    ));
  }

  void _onAddToTeam(
    PokemonAddToTeam event,
    Emitter<PokemonState> emit,
  ) {
    final onTeam = state.team.where((e) => e.name == event.pokemon.name);
    if (onTeam.isEmpty) {
      List<Pokemon> team = state.team;
      Pokemon pokemon = event.pokemon.copyWith(onTeam: true);
      final List<Pokemon> list = state.list;
      final index = list.indexWhere((e) => e.name == event.pokemon.name);
      list[index] = pokemon;
      emit(state.copyWith(team: [pokemon, ...team], list: list));
    }
  }

  void _onDeleteFromTeam(
    PokemonDelteFromTeam event,
    Emitter<PokemonState> emit,
  ) {
    List<Pokemon> team = state.team;
    Pokemon pokemon = event.pokemon.copyWith(onTeam: false);
    final List<Pokemon> list = state.list;
    final index = list.indexWhere((e) => e.name == event.pokemon.name);
    list[index] = pokemon;
    emit(state.copyWith(
      team: team.where((e) => e.name != event.pokemon.name).toList(),
      list: list,
    ));
  }
}
