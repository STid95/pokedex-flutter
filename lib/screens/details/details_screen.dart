import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pokedex_app/models/pokemon_provider.dart';
import 'package:pokedex_app/screens/home/components/pokemon_image.dart';

import '../../models/pokemon.dart';
import 'components/header.dart';
import 'components/pokeball.dart';
import 'components/pokemon_spec.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<PokemonProvider, Pokemon?>(
      selector: (context, provider) => provider.selectedPokemon,
      builder: (context, pokemon, child) => Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                color:
                    pokemon != null ? pokemon.types!.first.color : Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
          ),
          const Pokeball(),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Header(
                  pokemon: pokemon,
                ),
                SizedBox(
                  height: 750,
                  child: Stack(alignment: Alignment.topCenter, children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 5, right: 5, bottom: 5),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            height: 560,
                            child: pokemon != null
                                ? PokemonSpec(pokemon: pokemon)
                                : const Center(
                                    child: Text("Aucune info disponible...")),
                          )),
                    ),
                    if (pokemon != null) ...[
                      SizedBox(
                          width: 250,
                          height: 250,
                          child: PokemonImage(pokemon: pokemon)),
                    ]
                  ]),
                )
              ],
            ),
          ),
        ]),
      )),
    );
  }
}
