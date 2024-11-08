import 'package:enclst_core_dart/value.dart';

class Item {
  String title = "";
  Value value = Value("");

  /** 
  Create Item by line string

  A line string consist of value part and title part separated by separator '|'.
  A value string is prohibited to contain character "|", instead titile string can have.
  So, in case:

  ## separater "|" not exist
  All string should be value.

  ## separater "|" exist
  Strings before first "|" should be value and all of remains characters (include several "|"s) are for title.
 */
  Item.byStr(String line) {
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

  /// Default empty constructor.
  Item() {}
}
