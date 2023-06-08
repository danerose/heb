import 'package:equatable/equatable.dart';

import 'package:heb/app/domain/entities/pokemon/pokemon.entity.dart';

class PokemonState extends Equatable {
  const PokemonState({
    this.next = '',
    this.loading = false,
    this.loadingMore = false,
    this.team = const [],
    this.list = const [],
  });

  final String next;
  final bool loading;
  final bool loadingMore;
  final List<Pokemon> team;
  final List<Pokemon> list;

  PokemonState copyWith({
    String? next,
    bool? loading,
    bool? loadingMore,
    List<Pokemon>? team,
    List<Pokemon>? list,
  }) {
    return PokemonState(
      team: team ?? this.team,
      list: list ?? this.list,
      next: next ?? this.next,
      loading: loading ?? this.loading,
      loadingMore: loadingMore ?? this.loadingMore,
    );
  }

  @override
  List<Object?> get props => [next, loading, loadingMore, team, list];
}
