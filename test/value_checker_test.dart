import 'package:enclst_core_dart/enclst_core_dart.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final enclst = Enclst("");
  test('test isPath', () {
    expect(enclst.isPath("http://ahoaho"), true);
  });
}
