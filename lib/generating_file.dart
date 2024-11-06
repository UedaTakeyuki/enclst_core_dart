import 'package:path/path.dart' as p;
import 'package:enclst_core_dart/mixins/value_checker.dart';

class GeneratingFile with ValueChecker {
  String ganeratingFilePath;

  GeneratingFile(this.ganeratingFilePath);

  nextPath(String path, {String v_root = ""}) {
    if (isURL(path)) {
      // path is full url
      return path;
    } else if (path[0] == "/") {
      // URL - filename
      String origin = (Uri.parse(ganeratingFilePath)).origin;
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
      return (context
          .canonicalize(context.join(ganeratingFilePath, "..", path)));
    }
  }
}
