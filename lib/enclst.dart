import 'package:enclst_core_dart/generating_file.dart';
import 'package:http/http.dart' as http;
import 'package:enclst_core_dart/item.dart';
import 'package:enclst_core_dart/mixins/value_checker.dart';
import 'package:path/path.dart' as p;

class Enclst with ValueChecker {
  String title = "";
  String url = "";
  List<Item> items = [];
  GeneratingFile? g_file;

  // Constructor
  Enclst(String enclstStr) {
    final re = RegExp(r'\r\n|\n');
    List<String> lines = enclstStr.split(re);
    title = lines[0];

    // find a blank line
    while (lines.isNotEmpty) {
      if (lines[0] == "") {
        // remove blank line
        lines.removeAt(0);
        // escape from loop looking for a blank line
        break;
      }
      lines.removeAt(0);
    }

    // make items
    while (lines.isNotEmpty) {
      var line = lines[0];
      if (line != "") {
        items.add(Item(lines[0]));
      }
      lines.removeAt(0);
    }
  }

  // Static creator
  static Future<Enclst> createFromURL(String urlStr) async {
    var uri = Uri.parse(urlStr);
    var response = await http.get(uri);
    var enclistStr = response.body;
    final enclst = Enclst(enclistStr);
    enclst.g_file = GeneratingFile(urlStr);
    return enclst;
  }

  // next Enclst
  nextEnclst(String path, {String v_root = ""}) async {
    var next = g_file?.nextPath(path, v_root: v_root);
    return await createFromURL(next);
  }
}
