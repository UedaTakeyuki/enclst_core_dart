import 'package:enclst_core_dart/enclst.dart';
import 'package:flutter_test/flutter_test.dart';

const enclstStr = '''
Test EncLst | Test EncLst

aho, baka, boke=kasu | aho
🐙, 🦑, 🐟=🐠 | 🐡
''';

main() {
  final Enclst enclst = Enclst.byStr(enclstStr);
  test('Enclst', () {
    expect(enclst.title, "Test EncLst | Test EncLst");
    expect(enclst.items.length, 2);
  });
}
