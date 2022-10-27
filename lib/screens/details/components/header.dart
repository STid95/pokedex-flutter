import 'package:flutter/material.dart';
import 'package:pokedex_app/constants.dart';

import '../../../models/pokemon.dart';
import '../../shared_components/pokemon_id.dart';

class Header extends StatelessWidget {
  final Pokemon? pokemon;
  const Header({
    Key? key,
    this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        color: Colors.black,
        child: Row(
          children: [
            GestureDetector(
              child: const Icon(
                Icons.arrow_back,
                size: 38,
                color: Colors.white,
              ),
              onTap: () => Navigator.pop(context),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(pokemon != null ? pokemon!.name.capitalize() : '',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                      color: Colors.white)),
            ),
            if (pokemon != null)
              PokemonId(
                pokemon: pokemon!,
                textColor: Colors.white,
              )
          ],
        ),
      ),
    );
  }
}
