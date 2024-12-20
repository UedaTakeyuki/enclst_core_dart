import 'package:enclst_core_dart/enclst_core_dart.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  final e = await Enclst.createFromURL(
      'https://raw.githubusercontent.com/UedaTakeyuki/HS2playlist/refs/heads/main/wagner/Theater/menu.enclst');
  test('test nextURL', () {
    expect(e.filepath,
        'https://raw.githubusercontent.com/UedaTakeyuki/HS2playlist/refs/heads/main/wagner/Theater/menu.enclst');
    expect(e.nextFilePath("Deutschland/menu.enclst"),
        "https://raw.githubusercontent.com/UedaTakeyuki/HS2playlist/refs/heads/main/wagner/Theater/Deutschland/menu.enclst");
    expect(e.nextFilePath("/Deutschland/menu.enclst"),
        "https://raw.githubusercontent.com/Deutschland/menu.enclst");
    expect(
        e.nextFilePath("/Deutschland/menu.enclst",
            v_root: "https://raw.githubusercontent.com/UedaTakeyuki/"),
        "https://raw.githubusercontent.com/UedaTakeyuki/Deutschland/menu.enclst");
    expect(
        e.nextFilePath("/Deutschland/menu.enclst",
            v_root: "https://raw.githubusercontent.com/UedaTakeyuki"),
        "https://raw.githubusercontent.com/UedaTakeyuki/Deutschland/menu.enclst");
  });

  test('test nextEnclst', () async {
    final next = await e.nextEnclst("Deutschland/BayreutherFestspiele.enclst");
    expect(next.title, "Bayreuther Festspiele");
  });
}
