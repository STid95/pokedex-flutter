import 'package:flutter/material.dart';

import '../../../models/pokemon.dart';

class StatsGraph extends StatelessWidget {
  final Pokemon pokemon;
  const StatsGraph({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: pokemon.stats
              .map((e) => Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: pokemon.types!.first.color.withOpacity(0.2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        width: MediaQuery.of(context).size.width,
                        height: 6,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: pokemon.types!.first.color,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        width: MediaQuery.of(context).size.width *
                            (e.baseStat / 300),
                        height: 6,
                      ),
                    ],
                  ))
              .toList()),
    );
  }
}
