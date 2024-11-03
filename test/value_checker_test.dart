import 'package:enclst_core_dart/enclst_core_dart.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final e = Enclst("");
  test('test isPath', () {
    expect(e.isPath("http://ahoaho"), true);
    expect(e.isPath("https://ahoaho"), true);
    expect(e.isPath("ahoaho/boke"), true);
    expect(e.isPath("./ahoaho/boke"), true);
    expect(e.isPath("/ahoaho/boke"), true);
    expect(e.isPath("ahoahoboke"), false);
  });
  test("test isEnclst", () {
    expect(e.isEnclst("aho.enclst"), true);
    expect(e.isEnclst('aho.enclist'), false);
  });
  test("test isYTcontentID", () {
    expect(e.isYTcontentID("NiRIbKwAejk"), true);
    expect(e.isYTcontentID("NiRIbKwAejk0"), false);
    expect(e.isYTcontentID("NiRI.enclst"), false);
    expect(e.isYTcontentID("https://NiR"), false);
  });
  test("is isYTplaylistID", () {
    expect(e.isYTplaylistID("PLA51C5154D20F440C"), true);
    expect(e.isYTplaylistID("PLQWzKIaERirwyaLCHXafULQs4In_FS2WA"), true);
    expect(e.isYTplaylistID("PLQWzKIaERirwyaLCHXafULQs4In_FS2WA0"), false);
    expect(e.isYTplaylistID("PLQWzKIaERirwyaLCHXafULQs4I.enclst"), false);
    expect(e.isYTplaylistID("https://PLQWzKIaERirwyaLCHXafULQs4"), false);
  });
}
