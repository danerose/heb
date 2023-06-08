import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heb/app/domain/entities/pokemon/pokemon.entity.dart';
import 'package:heb/core/exceptions/custom.exceptions.dart';

import 'package:heb/app/domain/entities/pokemon_response.entity.dart';
import 'package:heb/app/domain/usecases/get_pokemon_list.usecase.dart';

import 'package:heb/app/presentation/bloc/pokemons/pokemon.state.dart';
import 'package:heb/app/presentation/bloc/pokemons/pokemons.event.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final GetPokemonListUsecase _getPokemonList;
  PokemonBloc(this._getPokemonList) : super(PokemonLoadingState()) {
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
    await Future.delayed(const Duration(seconds: 2));
    list[0] = list[0].copyWith(loading: false);
    emit(PokemonLoadedState(list));
  }
}
