import 'package:enclst_core_dart/item.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final item = Item();
  test('Empty Item test', () {
    expect(item.title, "");
  });
}
