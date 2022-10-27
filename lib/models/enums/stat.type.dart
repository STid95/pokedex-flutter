enum StatType {
  hp("HP", "hp"),
  attack("ATK", "attack"),
  defense("DEF", "defense"),
  specialAttack("SATK", "special-attack"),
  specialDefense("SDEF", "special-defense"),
  speed("SPD", "speed");

  const StatType(this.displayName, this.type);
  final String displayName;
  final String type;

  factory StatType.fromJson(String type) {
    return StatType.values.firstWhere((element) => element.type == type);
  }
}
