import 'package:equatable/equatable.dart';

sealed class PokemonState extends Equatable {}

class PokemonLoadingState extends PokemonState {
  @override
  List<Object?> get props => [];
}

class PokemonLoadedState extends PokemonState {
  @override
  List<Object?> get props => [];
}
