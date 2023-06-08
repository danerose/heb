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
  ) : super(PokemonLoadingState()) {
    on<PokemonLoadList>(_onLoad);
  }

  Future<void> _onLoad(
    PokemonLoadList event,
    Emitter<PokemonState> emit,
  ) async {
    emit(PokemonLoadingState());
    final res = await _getPokemonList.execute();
    late List<Pokemon> list = [];
    res.fold(
      (CustomException l) => emit(PokemonErrorState()),
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
        loading: false,
      );
      emit(PokemonLoadedState(list));
    }
  }
}
