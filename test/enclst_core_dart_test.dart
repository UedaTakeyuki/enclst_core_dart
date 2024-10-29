import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:enclst_core_dart/enclst_core_dart.dart';

void main() async {
  var enclistStr = await getText();
  test('adds one to input values', () {
    final enclst = Enclst(enclistStr);
    expect(enclst.title, "Journal");
  });
}

Future<String> getText() async {
  var uri = Uri.parse(
      'https://raw.githubusercontent.com/UedaTakeyuki/EncLst/refs/heads/main/examples/EncycloList/lang/fr/journal/journal.enclst');
  var response = await http.get(uri);
  var text = response.body;
  return text;
}
