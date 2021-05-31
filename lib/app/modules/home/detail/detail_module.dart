import 'package:superhero/app/modules/home/detail/detail_Page.dart';
import 'package:superhero/app/modules/home/detail/detail_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DetailModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DetailStore()),
    // Bind.singleton((i) => DetailStore(HeroModel: i.args.data))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => DetailPage(herosModel: args.data)),
  ];
}
