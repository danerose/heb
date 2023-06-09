import 'dart:io';

String readPokemonListJson() {
  var dir = Directory.current.path;
  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/test', '');
  }
  return File(
    '$dir/test/test_helpers/dummy/json/pokemon_list_dummy_response.json',
  ).readAsStringSync();
}

String readPokemonDetailJson() {
  var dir = Directory.current.path;
  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/test', '');
  }
  return File(
    '$dir/test/test_helpers/dummy/json/pokemon_detail_dummy_response.json',
  ).readAsStringSync();
}
