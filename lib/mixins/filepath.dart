import 'package:enclst_core_dart/mixins/value_checker.dart';
import 'package:path/path.dart' as p;

mixin FilePath on ValueChecker {
  String? filepath;

/**
  Calculate the file path of the next Encrust file.

  Depending on what the parameter ```path``` is like, evaluate it as following:

  ## full url
  Calculate subsequent URL from the current URL that storeed in the member valuable of this enclst, and a parameter path that indicate a next enclst which is loading.
  Retuned nextURL is calculated as joind of the current url and path.
  You can optionally specify a base_url, which will be used instead of the current url.

  ### absolute path
  Calculate subsequent URL from the current URL that storeed in the member valuable of this enclst, and a parameter path that indicate a next enclst which is loading.
  Retuned nextURL is calculated as joind of the current url and path.
  You can optionally specify a base_url, which will be used instead of the current url.

  #### absolute path with aditional virtual path 
  Calculate subsequent URL from the current URL that storeed in the member valuable of this enclst, and a parameter path that indicate a next enclst which is loading.
  Retuned nextURL is calculated as joind of the current url and path.
  You can optionally specify a base_url, which will be used instead of the current url.

  ##### relative path 
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
    // path is full url, use it as is.
    if (isURL(path)) {
      return path;

      // path is absolute
    } else if (path[0] == "/") {
      // Get origin (protocol:port//server name) from current file path.
      String origin = (Uri.parse(filepath ?? "")).origin;

      // The virtual root is specified.
      if (v_root != "") {
        // if it end with `/`
        if (v_root[v_root.length - 1] == '/') {
          // remove trailing '/'
          v_root = v_root.substring(0, v_root.length - 1);
        }
        // Set specified virtual root as origin
        origin = v_root;
      }

      // note: THe path string is start with `/`.
      return origin + path;

      // path is relative
    } else {
      // set path context for url
      var context = p.Context(style: p.Style.url);
      // join current parent path (..) and filepath
      return (context.canonicalize(context.join(filepath ?? "", "..", path)));
    }
  }
}
