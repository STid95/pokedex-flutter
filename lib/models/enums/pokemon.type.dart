import 'package:flutter/material.dart';

enum PokemonType {
  bug("Bug", Color(0xffa7b723)),
  dark("Dark", Color(0xff75574C)),
  dragon("Dragon", Color(0xff7037FF)),
  electric("Electric", Color(0xffF9CF30)),
  fairy("Fairy", Color(0xffE69EAC)),
  fighting("Fighting", Color(0xffC12239)),
  fire("Fire", Color(0xffF57D31)),
  flying("Flying", Color(0xffA891EC)),
  ghost("Ghost", Color(0xff70559B)),
  grass("Grass", Color(0xff74CB48)),
  ground("Ground", Color(0xffDEC16B)),
  ice("Ice", Color(0xff9AD6DF)),
  normal("Normal", Color(0xffAAA67F)),
  poison("Poison", Color(0xffA43E9E)),
  psychic("Psychic", Color(0xffFB5584)),
  rock("Rock", Color(0xffB69E31)),
  shadow("Shadow", Color(0xff843885)),
  steel("Steel", Color(0xffB7B9D0)),
  unknown("Unknown", Color(0xff68A090)),
  water("Water", Color(0xff6493EB));

  const PokemonType(this.displayName, this.color);
  final String displayName;
  final Color color;

  factory PokemonType.fromJson(String type) {
    if (PokemonType.values
        .where((element) => element.displayName.toLowerCase() == type)
        .isNotEmpty) {
      return PokemonType.values
          .firstWhere((element) => element.displayName.toLowerCase() == type);
    } else {
      return PokemonType.unknown;
    }
  }
}
