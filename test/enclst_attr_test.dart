import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:enclst_core_dart/enclst_core_dart.dart';

void main() async {
  test('adds one to input values', () async {
//    final enclst = Enclst(enclistStr);
    final enclst = await Enclst.createFromURL(
        'https://raw.githubusercontent.com/UedaTakeyuki/EncLst/refs/heads/main/examples/TimeTables/Ooimachi-line/mizonokuchiWeekday4Ooimach.enclst');
    final items = enclst.items;
    expect(enclst.value.first(), "enclst_type=timetable");
    expect(enclst.value.namedValues["enclst_type"], "timetable");
    expect(enclst.title, "平日）溝の口駅 大井町方面");
    expect(items[0].title, "5時7分発 各停（二子新地・高津停車） 大井町行き");
    expect(items[0].value.first(), "0507");
  });
}
