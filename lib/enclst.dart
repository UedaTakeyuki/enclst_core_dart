import 'package:http/http.dart' as http;
import 'package:enclst_core_dart/item.dart';
import 'package:enclst_core_dart/mixins/value_checker.dart';
import 'package:path/path.dart' as p;

class Enclst with ValueChecker {
  String title = "";
  String url = "";
  List<Item> items = [];

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
    enclst.url = urlStr;
    return enclst;
  }

  /**
   * Calculate subsequent URL from the Current URL and Next path

  * @param {string} currentURL Current URL 
   * @param {string} path Next path
   * @param {string} base_url Base url of this path, or nil.
   * @returns {string} created URL as follows:
   * <ul>
   *   <li> if path is started from "http://", just return paht</li>
   *   <li> else if path is started from "/"
   *   <ul>
   *     <li> if base_url is not specified, return CurrentURL + path
   *     <li> if base_url is specified, return base_url + path
   *   </ul>
   *   <li> else, return URL(path, currentURL)
   * </ul>
   * 
   */
  nextURL(String path, {String base_url = ""}) {
    if (isURL(path)) {
      // path is full url
      return path;
    } else if (path[0] == "/") {
      // path is full path
      if (base_url == "") {
        base_url = (Uri.parse(url)).origin;
      }
      if (base_url[base_url.length - 1] == '/') {
        // remove trailing '/'
        base_url = base_url.substring(0, base_url.length - 1);
      }
      return base_url + path;
    } else {
      // path is relative path
      var context = p.Context(style: p.Style.url);
      return (context.canonicalize(context.join(url, "..", path)));
    }
  }

  nextEnclst(String path, {String base_url = ""}) async {
    var next = nextURL(path, base_url: base_url);
    return await createFromURL(next);
  }
}
