class Biography {
  String fullName;
  String alterEgos;
  List<String> aliases;
  String placeOfBirth;
  String firstAppearance;
  String publisher;
  String alignment;
  Biography({
    required this.fullName,
    required this.alterEgos,
    required this.aliases,
    required this.placeOfBirth,
    required this.firstAppearance,
    required this.publisher,
    required this.alignment,
  });

  factory Biography.fromJson(Map<String, dynamic> json) {
    return Biography(
      fullName: json['fullName'],
      alterEgos: json['alterEgos'],
      aliases: json['aliases'].cast<String>(),
      placeOfBirth: json['placeOfBirth'],
      firstAppearance: json['firstAppearance'],
      publisher: json['publisher'] ?? "null",
      alignment: json['alignment'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['alterEgos'] = this.alterEgos;
    data['aliases'] = this.aliases;
    data['placeOfBirth'] = this.placeOfBirth;
    data['firstAppearance'] = this.firstAppearance;
    data['publisher'] = this.publisher;
    data['alignment'] = this.alignment;
    return data;
  }
}
