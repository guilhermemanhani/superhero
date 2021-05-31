import 'dart:math';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:superhero/app/models/heros_model.dart';
import 'package:superhero/app/repository/hero/hero_repository.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final _disposers = <ReactionDisposer>[];

  HeroRepository _repository = Modular.get<HeroRepository>();

  HomeStoreBase(this._repository) {
    if (hero.isEmpty) findHeroRep();
    _disposers.add(autorun((_) {
      if (heroFuture?.status == FutureStatus.fulfilled) {
        hero = heroFuture!.value!.asObservable();
      }
    }));
  }

  @observable
  ObservableList<HerosModel> hero = <HerosModel>[].asObservable();

  @computed
  List<HerosModel> get listFiltered {
    if (filter.isEmpty) {
      return hero;
    } else if (filter.contains('Female')) {
      return hero
          .where((element) => element.appearance.gender.contains("Female"))
          .toList();
    } else if (filter.contains('Male')) {
      return hero
          .where((element) => element.appearance.gender.contains("Male"))
          .toList();
    } else {
      return hero.where((element) => element.name.contains(filter)).toList();
    }
  }

  int random(max) {
    var rn = new Random();
    int random = rn.nextInt(max);
    return random;
  }

  @observable
  String filter = "";

  @action
  setFilter(String value) => filter = value;

  @observable
  ObservableFuture<List<HerosModel>>? heroFuture;

  @computed
  bool get isLoadingSearch => heroFuture?.status == FutureStatus.pending;

  Future<void> findHeroRep() async {
    heroFuture = _repository.findHero().asObservable();
  }
}
