import 'package:flutter/material.dart';

import '../../models/pokemon.dart';

class PokemonId extends StatelessWidget {
  final Pokemon pokemon;
  final Color textColor;

  const PokemonId({
    Key? key,
    required this.pokemon,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("#${pokemon.id}",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: textColor, fontSize: 17))
        ],
      ),
    );
  }
}
