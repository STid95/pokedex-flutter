import 'package:flutter/material.dart';

import 'package:pokedex_app/services/general_api.dart';

import '../../models/pokemon.dart';
import 'components/header.dart';
import 'components/loading.dart';
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
        body: Column(
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
            : const Loading()
      ],
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
