import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:enclst_core_dart/enclst_core_dart.dart';

void main() async {
  var enclistStr = await getText();
  test('adds one to input values', () {
    final enclst = Enclst(enclistStr);
    final items = enclst.items;
    expect(enclst.title, "Journal");
    expect(items[0].title, "Courrier international");
    expect(items[0].value.positionalValues[0],
        "https://www.courrierinternational.com");
    expect(items.length, 19);
  });
}

Future<String> getText() async {
  var uri = Uri.parse(
      'https://raw.githubusercontent.com/UedaTakeyuki/EncLst/refs/heads/main/examples/EncycloList/lang/fr/journal/journal.enclst');
  var response = await http.get(uri);
  var text = response.body;
  return text;
}
