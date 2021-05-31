class Powerstats {
  int intelligence;
  int strength;
  int speed;
  int durability;
  int power;
  int combat;
  Powerstats({
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
  });

  factory Powerstats.fromJson(Map<String, dynamic> json) {
    return Powerstats(
      intelligence: json['intelligence'],
      strength: json['strength'],
      speed: json['speed'],
      durability: json['durability'],
      power: json['power'],
      combat: json['combat'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['intelligence'] = this.intelligence;
    data['strength'] = this.strength;
    data['speed'] = this.speed;
    data['durability'] = this.durability;
    data['power'] = this.power;
    data['combat'] = this.combat;
    return data;
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'intelligence': intelligence,
  //     'strength': strength,
  //     'speed': speed,
  //     'durability': durability,
  //     'power': power,
  //     'combat': combat,
  //   };
  // }

  // factory Powerstats.fromMap(Map<String, dynamic> map) {
  //   return Powerstats(
  //     intelligence: map['intelligence'],
  //     strength: map['strength'],
  //     speed: map['speed'],
  //     durability: map['durability'],
  //     power: map['power'],
  //     combat: map['combat'],
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory Powerstats.fromJson(String source) =>
  //     Powerstats.fromMap(json.decode(source));
}
