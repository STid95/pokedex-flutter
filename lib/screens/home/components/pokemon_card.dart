import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon_provider.dart';
import 'package:pokedex_app/screens/details/details_screen.dart';
import 'package:provider/provider.dart';

import '../../../models/pokemon.dart';
import 'bottom_name.dart';
import '../../shared_components/pokemon_id.dart';
import 'pokemon_image.dart';

class PokemonCard extends StatelessWidget {
  final AsyncSnapshot<Pokemon?> snapshot;
  const PokemonCard({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
              color: snapshot.hasData && snapshot.data!.types != null
                  ? snapshot.data!.types!.first.color
                  : Colors.black),
        ),
        child: snapshot.hasData
            ? GestureDetector(
                onTap: () {
                  Provider.of<PokemonProvider>(context, listen: false)
                      .updatePokemon(snapshot.data!);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DetailsScreen()),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    PokemonId(
                      pokemon: snapshot.data!,
                      textColor: snapshot.data!.types!.first.color,
                    ),
                    Expanded(child: PokemonImage(pokemon: snapshot.data!)),
                    BottomWithName(pokemon: snapshot.data!),
                  ],
                ),
              )
            : const Center(child: CircularProgressIndicator()));
  }
}
