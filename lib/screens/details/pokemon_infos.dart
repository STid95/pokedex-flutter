import 'package:flutter/material.dart';

import '../../models/pokemon.dart';
import 'components/moves.dart';
import 'components/physicals_infos.dart';

class PokemonInfos extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonInfos({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          PhysicalsInfos(
            charaType: "weight",
            chara: pokemon.weight,
            unity: "kg",
          ),
          PhysicalsInfos(
            charaType: "height",
            chara: pokemon.height,
            unity: "cm",
          ),
          Moves(moves: pokemon.moves),
        ],
      ),
    );
  }
}
