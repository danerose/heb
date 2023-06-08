import 'package:equatable/equatable.dart';
import 'package:heb/app/domain/entities/pokemon/pokemon_detail.entity.dart';

class Pokemon extends Equatable {
  final String name;
  final String url;
  final bool onTeam;
  final PokemonDetail detail;

  const Pokemon({
    required this.name,
    required this.url,
    required this.onTeam,
    required this.detail,
  });

  const Pokemon.empty()
      : name = '',
        url = '',
        onTeam = false,
        detail = const PokemonDetail.empty();

  Pokemon copyWith({
    bool? onTeam,
    PokemonDetail? detail,
  }) {
    return Pokemon(
      name: name,
      url: url,
      onTeam: onTeam ?? this.onTeam,
      detail: detail ?? this.detail,
    );
  }

  @override
  List<Object?> get props => [
        name,
        onTeam,
        detail,
      ];
}
