import 'package:flutter/material.dart';
import 'package:pokedex_app/constants.dart';

import '../../../models/pokemon.dart';

class BottomWithName extends StatelessWidget {
  final Pokemon pokemon;
  const BottomWithName({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: pokemon.types!.first.color,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        padding: const EdgeInsets.all(5),
        child: Text(pokemon.name.capitalize(),
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white)));
  }
}
