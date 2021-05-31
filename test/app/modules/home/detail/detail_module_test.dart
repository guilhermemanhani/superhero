import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superhero/app/modules/home/detail/detail_module.dart';

void main() {
  setUpAll(() {
    initModule(DetailModule());
  });
}
