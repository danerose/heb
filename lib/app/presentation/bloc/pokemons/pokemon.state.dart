import 'package:equatable/equatable.dart';
import 'package:heb/app/domain/entities/pokemon/pokemon.entity.dart';

sealed class PokemonState extends Equatable {}

class PokemonLoadingState extends PokemonState {
  @override
  List<Object?> get props => [];
}

class PokemonLoadedState extends PokemonState {
  PokemonLoadedState(this.list);
  final List<Pokemon> list;
  @override
  List<Object?> get props => [list];
}

class PokemonErrorState extends PokemonState {
  @override
  List<Object?> get props => [];
}
