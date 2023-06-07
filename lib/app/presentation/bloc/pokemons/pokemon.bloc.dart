import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heb/app/presentation/bloc/pokemons/pokemon.state.dart';
import 'package:heb/app/presentation/bloc/pokemons/pokemons.event.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonLoadingState()) {
    on<PokemonLoadList>(_onLoad);
  }

  Future<void> _onLoad(
    PokemonLoadList event,
    Emitter<PokemonState> emit,
  ) async {
    emit(PokemonLoadingState());
    Future.delayed(const Duration(milliseconds: 1500)).then((_) {
      emit(PokemonLoadedState());
    });
  }
}
