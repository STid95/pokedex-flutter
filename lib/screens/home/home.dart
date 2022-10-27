import 'package:flutter/material.dart';

import 'package:pokedex_app/services/general_api.dart';

import '../../models/pokemon.dart';
import 'components/header.dart';
import 'components/pokemon_grid.dart';
import 'components/search_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GeneralApi api = GeneralApi();
  List<Pokemon>? pokemons;
  List<Pokemon>? results;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(),
          SearchBar(onSearch: ((value) => print(value))),
          FutureBuilder(
              future: api.getAllPokemons().then((value) {
                if (value is PokemonListResponse) {
                  return value.getPokemons();
                }
              }),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  pokemons = snapshot.data;
                  return PokemonGrid(
                    pokemons: pokemons,
                  );
                } else {
                  return Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Juste un instant, je cherche...",
                              style: Theme.of(context).textTheme.headline6),
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: SizedBox(
                                height: 200,
                                width: 200,
                                child: CircularProgressIndicator()),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              })),
        ],
      ),
    ));
  }
}
