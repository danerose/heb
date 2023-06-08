import 'package:equatable/equatable.dart';
import 'package:heb/app/domain/entities/pokemon/pokemon.entity.dart';

class PokemonResponse extends Equatable {
  final int count;
  final String next;
  final String previous;
  final List<Pokemon> results;

  const PokemonResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  const PokemonResponse.empty()
      : count = 0,
        next = '',
        previous = '',
        results = const [];

  @override
  List<Object?> get props => [count, next, previous, results];
}
