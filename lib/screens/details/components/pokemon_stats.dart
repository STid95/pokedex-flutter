import 'package:flutter/material.dart';
import 'package:pokedex_app/screens/details/components/stats_graph.dart';
import 'package:pokedex_app/screens/details/components/stats_names.dart';
import 'package:pokedex_app/screens/details/components/stats_values.dart';

import '../../../models/pokemon.dart';

class PokemonStats extends StatelessWidget {
  const PokemonStats({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          StatsNames(pokemon: pokemon),
          StatsValues(stats: pokemon.stats),
          Flexible(
            flex: 2,
            child: StatsGraph(
              pokemon: pokemon,
            ),
          )
        ],
      ),
    );
  }
}
