import 'package:equatable/equatable.dart';
import 'package:heb/app/domain/entities/pokemon/pokemon.entity.dart';

class PokemonState extends Equatable {
  const PokemonState({
    this.loading = false,
    this.team = const [],
    this.list = const [],
  });

  final bool loading;
  final List<Pokemon> team;
  final List<Pokemon> list;

  PokemonState copyWith({
    bool? loading,
    List<Pokemon>? team,
    List<Pokemon>? list,
  }) {
    return PokemonState(
      loading: loading ?? this.loading,
      team: team ?? this.team,
      list: list ?? this.list,
    );
  }

  @override
  List<Object?> get props => [loading, team, list];
}
