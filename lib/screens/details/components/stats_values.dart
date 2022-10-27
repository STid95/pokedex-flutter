import 'package:flutter/material.dart';

import '../../../models/pokemon_stat.dart';

class StatsValues extends StatelessWidget {
  final List<PokemonStat> stats;
  const StatsValues({
    Key? key,
    required this.stats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: stats
              .map((e) => Text(
                    e.baseStat.toString(),
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 15,
                        ),
                  ))
              .toList(),
        ));
  }
}
