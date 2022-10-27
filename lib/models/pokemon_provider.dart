import 'package:flutter/material.dart';

import 'package:pokedex_app/models/pokemon.dart';

class PokemonProvider extends ChangeNotifier {
  Pokemon? selectedPokemon;
  PokemonProvider({
    this.selectedPokemon,
  });

  void updatePokemon(Pokemon newPokemon) {
    selectedPokemon = newPokemon;
    notifyListeners();
  }
}
