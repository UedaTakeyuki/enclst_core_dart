mixin ValueChecker {
  bool isPath(String s) {
    if (s.substring(0, 6) == "http://" ||
        s.substring(0, 7) == "https://" ||
        s.substring(0, 6) == "file://") {
      return true;
    } else if (s.substring(0, 1) == "./" || s.substring(0, 0) == "/") {
      return true;
    } else if (s.indexOf('/') != -1) {
      return true;
    } else {
      return false;
    }
  }
}
