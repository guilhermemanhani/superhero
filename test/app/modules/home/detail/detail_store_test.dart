import 'package:flutter_test/flutter_test.dart';
import 'package:superhero/app/modules/home/detail/detail_store.dart';
 
void main() {
  late DetailStore store;

  setUpAll(() {
    store = DetailStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}