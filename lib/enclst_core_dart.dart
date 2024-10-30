library enclst_core_dart;

import 'package:enclst_core_dart/item.dart';

class Enclst {
  String title = "";
  List<Item> items = [];

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
}
