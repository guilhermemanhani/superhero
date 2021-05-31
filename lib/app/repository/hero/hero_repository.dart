import 'package:superhero/app/models/heros_model.dart';

abstract class HeroRepository {
  Future<List<HerosModel>> findHero();

  Future<HerosModel> findIdHero(int id);
}
