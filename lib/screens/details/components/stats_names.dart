import 'package:flutter/material.dart';

import '../../../models/pokemon.dart';

class StatsNames extends StatelessWidget {
  final Pokemon pokemon;
  const StatsNames({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
          border: Border(right: BorderSide(width: 0.5, color: Colors.grey))),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: pokemon.stats
              .map((e) => Text(e.type.displayName,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 15,
                      color: pokemon.types!.first.color,
                      fontWeight: FontWeight.bold)))
              .toList()),
    );
  }
}
