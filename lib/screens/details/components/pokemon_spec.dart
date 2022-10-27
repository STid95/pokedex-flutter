import 'package:flutter/material.dart';
import 'package:pokedex_app/screens/details/components/type_chips.dart';

import '../../../models/pokemon.dart';
import '../pokemon_infos.dart';
import 'description.dart';
import 'pokemon_stats.dart';

class PokemonSpec extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonSpec({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          TypeChips(pokemon: pokemon),
          Text("About",
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: pokemon.types!.first.color,
                  fontWeight: FontWeight.bold)),
          PokemonInfos(
            pokemon: pokemon,
          ),
          PokemonDescription(
            speciesUrl: pokemon.speciesUrl,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text("Base Stats",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: pokemon.types!.first.color,
                    fontWeight: FontWeight.bold)),
          ),
          PokemonStats(pokemon: pokemon)
        ]),
      ),
    );
  }
}
