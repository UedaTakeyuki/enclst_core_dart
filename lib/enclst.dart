// import 'package:enclst_core_dart/generating_file.dart';
import 'package:enclst_core_dart/mixins/filepath.dart';
import 'package:http/http.dart' as http;
import 'package:enclst_core_dart/item.dart';
import 'package:enclst_core_dart/mixins/value_checker.dart';
import 'package:enclst_core_dart/mixins/filepath.dart';

/**
 An object representation of the [Enclst Notation](https://github.com/UedaTakeyuki/EncLst/tree/main?tab=readme-ov-file#enclst-notation) for ***Dart***.
 */
class Enclst with ValueChecker, FilePath {
  String title = "";
  List<Item> items = [];

  /// Default empty constuctor
  Enclst() {}

  /// Constructor by enclst String
  Enclst.byStr(String enclstStr) {
    final re = RegExp(r'\r\n|\n');
    List<String> lines = enclstStr.split(re);
    title = lines[0];

    // find a blank line
    while (lines.isNotEmpty) {
      if (lines[0] == "") {
        // remove blank line
        lines.removeAt(0);
        break;
      }
      lines.removeAt(0);
    }

    // make items
    while (lines.isNotEmpty) {
      var line = lines[0];
      if (line != "") {
        items.add(Item.byStr(lines[0]));
      }
      lines.removeAt(0);
    }
  }

  /// Static creator by URL string
  static Future<Enclst> createFromURL(String urlStr) async {
    var uri = Uri.parse(urlStr);
    var response = await http.get(uri);
    var enclistStr = response.body;
    final enclst = Enclst.byStr(enclistStr);
    enclst.filepath = urlStr;
    return enclst;
  }

  // next Enclst
  nextEnclst(String path, {String v_root = ""}) async {
    final nextfilepath = nextFilePath(path, v_root: v_root);
    return await createFromURL(nextfilepath);
  }
}
