import 'package:flutter/material.dart';

import '../../../services/pokemon_api.dart';

class PokemonDescription extends StatelessWidget {
  final String speciesUrl;
  const PokemonDescription({
    Key? key,
    required this.speciesUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: FutureBuilder(
              future:
                  PokemonApi(link: speciesUrl).getDescription().then((value) {
                if (value is PokemonResponse) {
                  return value.getDescription();
                }
              }),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Row(
                    children: [
                      Flexible(
                        child: Text(
                          snapshot.hasData
                              ? snapshot.data!
                                  .replaceAll("\n", " ")
                                  .replaceAll("", " ")
                                  .replaceAll("POKéMON", "pokémon")
                              : '',
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              }),
        ),
      ],
    );
  }
}
