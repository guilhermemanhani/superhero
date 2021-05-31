// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  Computed<List<HerosModel>>? _$listFilteredComputed;

  @override
  List<HerosModel> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<HerosModel>>(() => super.listFiltered,
              name: 'HomeStoreBase.listFiltered'))
      .value;
  Computed<bool>? _$isLoadingSearchComputed;

  @override
  bool get isLoadingSearch =>
      (_$isLoadingSearchComputed ??= Computed<bool>(() => super.isLoadingSearch,
              name: 'HomeStoreBase.isLoadingSearch'))
          .value;

  final _$heroAtom = Atom(name: 'HomeStoreBase.hero');

  @override
  ObservableList<HerosModel> get hero {
    _$heroAtom.reportRead();
    return super.hero;
  }

  @override
  set hero(ObservableList<HerosModel> value) {
    _$heroAtom.reportWrite(value, super.hero, () {
      super.hero = value;
    });
  }

  final _$filterAtom = Atom(name: 'HomeStoreBase.filter');

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$heroFutureAtom = Atom(name: 'HomeStoreBase.heroFuture');

  @override
  ObservableFuture<List<HerosModel>>? get heroFuture {
    _$heroFutureAtom.reportRead();
    return super.heroFuture;
  }

  @override
  set heroFuture(ObservableFuture<List<HerosModel>>? value) {
    _$heroFutureAtom.reportWrite(value, super.heroFuture, () {
      super.heroFuture = value;
    });
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hero: ${hero},
filter: ${filter},
heroFuture: ${heroFuture},
listFiltered: ${listFiltered},
isLoadingSearch: ${isLoadingSearch}
    ''';
  }
}
