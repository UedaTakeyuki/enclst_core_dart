import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:enclst_core_dart/enclst_core_dart.dart';

void main() async {
  test('adds one to input values', () async {
//    final enclst = Enclst(enclistStr);
    final enclst = await Enclst.createFromURL(
        'https://raw.githubusercontent.com/UedaTakeyuki/EncLst/refs/heads/main/examples/EncycloList/lang/fr/journal/journal.enclst');
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

Future<Enclst> enclstFromURL(String urlStr) async {
  var uri = Uri.parse(urlStr);
  var response = await http.get(uri);
  var enclistStr = response.body;
  final enclst = Enclst.byStr(enclistStr);
  return enclst;
}
