import 'package:flutter/material.dart';
import 'package:pokedex_app/constants.dart';

class Moves extends StatelessWidget {
  final List<String> moves;
  const Moves({
    Key? key,
    required this.moves,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 4,
      child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(moves[0].capitalize()),
              Text(moves[1].capitalize()),
              const SizedBox(
                height: 5,
              ),
              Center(
                  child: Text("Moves",
                      style: Theme.of(context).textTheme.bodySmall))
            ],
          )),
    );
  }
}
