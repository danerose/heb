import 'dart:developer';

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
    emit(state.copyWith(loading: true));
    final res = await _getPokemonList.execute();
    late List<Pokemon> list = [];
    res.fold(
      (CustomException l) => list = [],
      (PokemonResponse r) => list = r.results,
    );
    final d = await Future.wait<Either<CustomException, PokemonDetailResponse>>(
      List.from(list.map((e) => _getPokemonDetail.execute(url: e.url))),
    );
    for (var i = 0; i < d.length; i++) {
      list[i] = list[i].copyWith(
        detail: d[i].fold(
          (l) => const PokemonDetail.empty(),
          (r) => PokemonDetail(sprite: r.sprite, type: r.types),
        ),
      );
    }
    emit(state.copyWith(loading: false, list: list));
  }

  void _onAddToTeam(
    PokemonAddToTeam event,
    Emitter<PokemonState> emit,
  ) {
    List<Pokemon> team = state.team;
    Pokemon pokemon = event.pokemon.copyWith(onTeam: true);
    final list = state.list;
    final index = list.indexWhere((e) => e.name == event.pokemon.name);
    list[index] = pokemon;
    emit(state.copyWith(team: [pokemon, ...team], list: list));
  }

  void _onDeleteFromTeam(
    PokemonDelteFromTeam event,
    Emitter<PokemonState> emit,
  ) {
    List<Pokemon> team = state.team;
    Pokemon pokemon = event.pokemon.copyWith(onTeam: false);
    final list = state.list;
    final index = list.indexWhere((e) => e.name == event.pokemon.name);
    list[index] = pokemon;

    emit(state.copyWith(
      team: team.where((e) => e.name != event.pokemon.name).toList(),
      list: list,
    ));
  }
}
