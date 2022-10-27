import 'package:flutter/material.dart';

import '../../../models/pokemon.dart';

class PokemonImage extends StatelessWidget {
  const PokemonImage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: pokemon.id,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage("assets/artwork/${pokemon.id}.png"))),
      ),
    );
  }
}
