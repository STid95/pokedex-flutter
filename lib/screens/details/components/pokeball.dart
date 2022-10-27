import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Pokeball extends StatelessWidget {
  const Pokeball({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      top: 10,
      child: SizedBox(
          height: 250,
          width: 250,
          child: SvgPicture.asset(
            "assets/icons/pokeball.svg",
            color: Colors.white.withOpacity(0.15),
          )),
    );
  }
}
