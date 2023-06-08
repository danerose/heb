import 'package:equatable/equatable.dart';
import 'package:heb/app/domain/entities/pokemon/pokemon_detail.entity.dart';

class Pokemon extends Equatable {
  final String name;
  final String url;
  final PokemonDetail detail;

  const Pokemon({
    required this.name,
    required this.url,
    required this.detail,
  });

  const Pokemon.empty()
      : name = '',
        url = '',
        detail = const PokemonDetail.empty();

  Pokemon copyWith({
    PokemonDetail? detail,
  }) {
    return Pokemon(
      name: name,
      url: url,
      detail: detail ?? this.detail,
    );
  }

  @override
  List<Object?> get props => [
        name,
        url,
        detail,
      ];
}
