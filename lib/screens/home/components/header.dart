import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_app/models/pokemon.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    Pokemon? pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
                height: 45,
                width: 45,
                child: SvgPicture.asset("assets/icons/pokeball.svg")),
          ),
          Text("Pokédex",
              style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: "Poppins"))
        ],
      ),
    );
  }
}
