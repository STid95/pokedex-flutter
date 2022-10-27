import 'package:flutter/material.dart';
import 'package:pokedex_app/constants.dart';

import '../../../models/pokemon.dart';

class TypeChips extends StatelessWidget {
  final Pokemon pokemon;
  const TypeChips({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return pokemon.types!.length > 1
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pokemon.types!
                .map((e) => Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Chip(
                        label: Text(e.name.capitalize(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                        backgroundColor: e.color,
                      ),
                    ))
                .toList())
        : Chip(
            label: Text(pokemon.types!.first.name.capitalize(),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            backgroundColor: pokemon.types!.first.color,
          );
  }
}
