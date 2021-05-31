import 'package:superhero/app/models/appearance.dart';
import 'package:superhero/app/models/biography.dart';
import 'package:superhero/app/models/connections.dart';
import 'package:superhero/app/models/images.dart';
import 'package:superhero/app/models/powerstats.dart';
import 'package:superhero/app/models/work.dart';

class HerosModel {
  int id;
  String name;
  String slug;
  Powerstats powerstats;
  Appearance appearance;
  Biography biography;
  Work work;
  Connections connections;
  Images images;

  HerosModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.powerstats,
    required this.appearance,
    required this.biography,
    required this.work,
    required this.connections,
    required this.images,
  });

  factory HerosModel.fromJson(Map<String, dynamic> json) {
    return HerosModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      powerstats: Powerstats.fromJson(json['powerstats']),
      appearance: Appearance.fromJson(json['appearance']),
      biography: Biography.fromJson(json['biography']),
      work: Work.fromJson(json['work']),
      connections: Connections.fromJson(json['connections']),
      images: Images.fromJson(json['images']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['powerstats'] = this.powerstats.toJson();
    data['appearance'] = this.appearance.toJson();
    data['biography'] = this.biography.toJson();
    data['work'] = this.work.toJson();
    data['connections'] = this.connections.toJson();
    data['images'] = this.images.toJson();
    return data;
  }
}
