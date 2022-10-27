import 'package:flutter/material.dart';

import '../../../models/pokemon.dart';
import '../../../services/pokemon_api.dart';
import 'pokemon_card.dart';

class PokemonGrid extends StatelessWidget {
  final ScrollController controller;
  final List<Pokemon>? pokemons;
  const PokemonGrid({
    Key? key,
    required this.pokemons,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: controller,
        padding: const EdgeInsets.all(20),
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        crossAxisCount: MediaQuery.of(context).size.width > 800 ? 4 : 2,
        children: pokemons != null
            ? pokemons!
                .map((e) => FutureBuilder(
                      future:
                          PokemonApi(link: e.url!).getPokemon().then((value) {
                        if (value is PokemonResponse) {
                          return value.getPokemon();
                        }
                      }),
                      builder: ((context, snapshot) =>
                          PokemonCard(snapshot: snapshot)),
                    ))
                .toList()
            : [const Center(child: Text("Aucun pokémon n'a été trouvé !"))]);
  }
}
