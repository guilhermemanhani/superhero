import 'package:flutter_modular/flutter_modular.dart';
import 'package:superhero/app/core/rest_client/rest_client.dart';
import 'package:superhero/app/core/rest_client/rest_client_dio.dart';
import 'package:superhero/app/repository/hero/hero_repository.dart';
import 'package:superhero/app/repository/hero/hero_repository_rest_client.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    // Bind.instance<RestClient>(restClient),
    Bind.lazySingleton<RestClient>((i) => RestClientDio()),
    Bind.lazySingleton<HeroRepository>(
        (i) => HeroRepositoryRestClient(restClient: i.get())),
    // Bind((i) => RestClientDio()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
