import 'package:dio/dio.dart';
import 'package:superhero/app/core/exceptions/repository_exception.dart';
import 'package:superhero/app/core/rest_client/rest_client.dart';
import 'package:superhero/app/models/heros_model.dart';
import 'package:superhero/app/repository/hero/hero_repository.dart';

class HeroRepositoryRestClient implements HeroRepository {
  final RestClient _restClient;
  HeroRepositoryRestClient({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<HerosModel>> findHero() async {
    try {
      final result = await _restClient.get("all.json");
      List<HerosModel> list = [];
      for (var json in (result.data as List)) {
        HerosModel model = HerosModel.fromJson(json);
        list.add(model);
      }
      // HerosModel.fromMap(result.data);
      return list;
    } on DioError catch (e, s) {
      print(e);
      print(s);
      throw RepositoryException();
    }
  }

  @override
  Future<HerosModel> findIdHero(int id) async {
    try {
      final result = await _restClient.get("id/$id.json");
      HerosModel model = HerosModel.fromJson(result.data);
      return model;
    } on DioError catch (e, s) {
      print(e);
      print(s);
      throw RepositoryException();
    }
  }
}
