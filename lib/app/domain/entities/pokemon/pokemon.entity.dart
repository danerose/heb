import 'package:equatable/equatable.dart';
import 'package:heb/app/domain/entities/pokemon/pokemon_detail.entity.dart';

class Pokemon extends Equatable {
  final String name;
  final String url;
  final PokemonDetail detail;
  final bool loading;

  const Pokemon({
    required this.name,
    required this.url,
    required this.detail,
    required this.loading,
  });

  const Pokemon.empty()
      : name = '',
        url = '',
        detail = const PokemonDetail.empty(),
        loading = true;

  Pokemon copyWith({
    PokemonDetail? detail,
    bool? loading,
  }) {
    return Pokemon(
      name: name,
      url: url,
      detail: detail ?? this.detail,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object?> get props => [name, url, detail, loading];
}
