import 'enums/stat.type.dart';

class PokemonStat {
  int baseStat;
  StatType type;
  PokemonStat({
    required this.baseStat,
    required this.type,
  });

  factory PokemonStat.fromJson(Map<String, dynamic> map) {
    return PokemonStat(
      baseStat: map['base_stat']?.toInt() ?? 0,
      type: StatType.fromJson(map['stat']['name']),
    );
  }
}
