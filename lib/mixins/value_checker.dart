import 'package:flutter/foundation.dart';

mixin ValueChecker {
  // is this Path?
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

  // is this Enclst?
  bool isEnclst(String s) {
    if (s.endsWith('.enclst')) {
      return true;
    } else {
      return false;
    }
  }

  // is this youtube contents ID?
  bool isYTcontentID(String s) {
    if (isPath(s) || isEnclst(s)) {
      return false;
    } else {
      if (s.length == 11) {
        return true;
      } else {
        return false;
      }
    }
  }

  // is this youtube playlist ID?
  bool isYTplaylistID(String s) {
    if (isPath(s) || isEnclst(s)) {
      return false;
    } else {
      if (s.substring(0, 2) == "PL") {
        if (s.length == 18 || s.length == 34) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    }
  }
}
