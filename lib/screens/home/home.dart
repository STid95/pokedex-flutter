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
  List<Pokemon> pokemons = [];
  List<Pokemon>? results;
  int offset = 0;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    getFuturePokemons();
    super.initState();

    _controller.addListener(() {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels == 0) {
        } else {
          getFuturePokemons();
        }
      }
    });
  }

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
          pokemons.isNotEmpty
              ? RefreshIndicator(
                  onRefresh: () => getFuturePokemons(),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: PokemonGrid(
                      controller: _controller,
                      pokemons: pokemons,
                    ),
                  ))
              : Center(
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
                )
        ],
      ),
    ));
  }

  Future<void> getFuturePokemons() {
    return api.getAllPokemons(offset).then((value) {
      if (value is PokemonListResponse) {
        setState(() {
          pokemons.addAll(value.getPokemons());
          offset = offset + 20;
        });
      }
    });
  }
}
