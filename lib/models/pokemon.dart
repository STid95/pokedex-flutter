import 'enums/pokemon.type.dart';
import 'pokemon_stat.dart';

class Pokemon {
  String name;
  List<PokemonType>? types;
  int id;
  String? url;
  String imageUrl;
  int height;
  int weight;
  List<String> moves;
  String speciesUrl;
  List<PokemonStat> stats;

  Pokemon(
      {required this.name,
      this.types,
      required this.id,
      this.url,
      required this.imageUrl,
      required this.height,
      required this.weight,
      required this.moves,
      required this.speciesUrl,
      required this.stats});

  factory Pokemon.fromJson(Map<String, dynamic> map) {
    return Pokemon(
        name: map['name'] ?? '',
        types: map['types'] != null
            ? List<PokemonType>.from(map['types']?.map((x) {
                if (x['type']['name'] != null) {
                  return PokemonType.fromJson(x['type']['name']);
                }
              }).toList())
            : null,
        id: map['id']?.toInt() ?? 0,
        url: map['url'],
        imageUrl: map['sprites'] != null ? map['sprites']['front_default'] : '',
        height: map['height'] ?? 0,
        weight: map['weight'] ?? 0,
        moves: map['moves'] != null
            ? List<String>.from(
                map['moves'].map((x) => x['move']['name']).toList())
            : [],
        speciesUrl: map['species'] != null ? map['species']['url'] ?? '' : '',
        stats: map['stats'] != null
            ? List<PokemonStat>.from(
                map['stats']?.map((x) => PokemonStat.fromJson(x)).toList())
            : []);
  }
}
