import 'package:enclst_core_dart/mixins/value_checker.dart';
import 'package:path/path.dart' as p;

mixin FilePath on ValueChecker {
  String? filepath;

/**
  Calculate subsequent URL from the current URL that storeed in the member valuable of this enclst, and a parameter path that indicate a next enclst which is loading.
  Retuned nextURL is calculated as joind of the current url and path.
  You can optionally specify a base_url, which will be used instead of the current url.

  @param {string} currentURL Current URL.<br>
  @param {string} path Next path.<br>
  @param {string} base_url Base url of this path, or nil.<br>
  @returns {string} created URL as follows:
  <ul>
    <li> if path is started from "http://", just return paht</li>
    <li> else if path is started from "/"
    <ul>
      <li> if base_url is not specified, return CurrentURL + path
      <li> if base_url is specified, return base_url + path
    </ul>
    <li> else, return URL(path, currentURL)
  </ul>
*/
  nextFilePath(String path, {String v_root = ""}) {
    if (isURL(path)) {
      // path is full url
      return path;
    } else if (path[0] == "/") {
      // URL - filename
      String origin = (Uri.parse(filepath ?? "")).origin;
      // path is full path
      if (v_root != "") {
        if (v_root[v_root.length - 1] == '/') {
          // remove trailing '/'
          v_root = v_root.substring(0, v_root.length - 1);
        }
        origin = v_root;
      }
      return origin + path;
    } else {
      // path is relative path
      var context = p.Context(style: p.Style.url);
      return (context.canonicalize(context.join(filepath ?? "", "..", path)));
    }
  }
}
