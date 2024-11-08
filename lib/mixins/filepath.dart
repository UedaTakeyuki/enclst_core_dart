import 'package:enclst_core_dart/mixins/value_checker.dart';
import 'package:path/path.dart' as p;

mixin FilePath on ValueChecker {
  String? filepath;

/**
  Calculate the file path of the next Encrust file.

  Depending on what the parameter ```path``` is like, evaluate it as following:

  ## Full URL
  In the case of the path is the full version of the URL string like a "https:www.a.com/b.enlist"
  which can be used as the parameter of the HTTP Get for fetching a new enclist file,
  this function returns the same string of the input parameter path as is. 
  
  ## Absolute Path
  In the case of the path is the absolute path string start with "/" like a "/b.enlist",
  return value is depend on the presence of an additional named parameter "v_root" indicating a virtual root. 

  ### without v-root
  Calculate subsequent URL from the current URL that storeed in the member valuable of this enclst, and a parameter path that indicate a next enclst which is loading.
  Retuned nextURL is calculated as joind of the current url and path.
  You can optionally specify a base_url, which will be used instead of the current url.

  ### with v-root 
  Calculate subsequent URL from the current URL that storeed in the member valuable of this enclst, and a parameter path that indicate a next enclst which is loading.
  Retuned nextURL is calculated as joind of the current url and path.
  You can optionally specify a base_url, which will be used instead of the current url.

  ## Relative Path 
  Calculate subsequent URL from the current URL that storeed in the member valuable of this enclst, and a parameter path that indicate a next enclst which is loading.
  Retuned nextURL is calculated as joind of the current url and path.
  You can optionally specify a base_url, which will be used instead of the current url.

*/
  String nextFilePath(String path, {String v_root = ""}) {
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
