import 'dart:convert';

import '../models/pokemon.dart';
import 'api.dart';

class GeneralApi with Api {
  Future<Response> getAllPokemons(int offset) => get(
      uri: Uri.parse(
          "https://pokeapi.co/api/v2/pokemon?limit=20&offset=$offset"),
      mapper: (value) {
        return PokemonListResponse(jsonObject: jsonDecode(value));
      });
}

class PokemonListResponse extends Response {
  Map<String, dynamic> jsonObject;
  PokemonListResponse({
    required this.jsonObject,
  });

  List<Pokemon> getPokemons() {
    final results = jsonObject["results"];

    List<Pokemon> pokemons = List<Pokemon>.from(results.map((e) {
      return Pokemon.fromJson(e);
    })).toList();

    return pokemons;
  }
}
