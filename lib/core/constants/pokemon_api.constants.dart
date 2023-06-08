class PokemonApiConstants {
  static const String pokemon = '/pokemon';
  static String pokemonDetail(String url) {
    final size = url.split('/');
    return '/pokemon/${size[size.length - (url.endsWith('/') ? 2 : 1)]}';
  }
}
