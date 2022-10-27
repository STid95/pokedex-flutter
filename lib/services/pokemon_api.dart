import 'dart:convert';

import '../models/pokemon.dart';
import 'api.dart';

class PokemonApi with Api {
  String link;
  PokemonApi({
    required this.link,
  });
  Future<Response> getPokemon() => get(
      uri: Uri.parse(link),
      mapper: (value) {
        return PokemonResponse(jsonObject: jsonDecode(value));
      });

  Future<Response> getDescription() => get(
      uri: Uri.parse(link),
      mapper: (value) {
        return PokemonResponse(jsonObject: jsonDecode(value));
      });
}

class PokemonResponse extends Response {
  Map<String, dynamic> jsonObject;
  PokemonResponse({
    required this.jsonObject,
  });

  Pokemon getPokemon() {
    return Pokemon.fromJson(jsonObject);
  }

  String getDescription() {
    List<dynamic> entries = jsonObject['flavor_text_entries'];
    final english =
        entries.firstWhere((element) => element['language']['name'] == "en");
    return english['flavor_text'];
  }
}
