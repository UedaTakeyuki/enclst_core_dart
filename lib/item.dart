import 'package:enclst_core_dart/value.dart';

class Item {
  String title = "";
  Value value = Value("");

  Item(String line) {
    if ("" == line) {
      value = Value("");
    } else {
      List<String> separatedLine = line.split('|');
      switch (separatedLine.length) {
        case 1:
          value = Value(separatedLine[0].trim());
          title = "";
          break;
        case 2:
          value = Value(separatedLine[0].trim());
          title = separatedLine[1].trim();
          break;
        default:
          value = Value(separatedLine[0].trim());
          separatedLine.removeAt(0);
          title = separatedLine.join('|').trim();
          break;
      }
    }
  }
}
