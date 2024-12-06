class Value {
  // positional values
  List<String> positionalValues = [];

  // named value
  Map<String, String> namedValues = {};

  /// Default empty constructor
  Value() {}

  /// Constructor by String
  Value.byStr(String valueStr) {
    readStr(valueStr);
    /*
    if ("" != valueStr) {
      var values = valueStr.split(',');
      for (var i = 0; i < values.length; i++) {
        values[i] = values[i].trim();

        // push to positional
        positionalValues.add(values[i]);

        var nameAndValue = positionalValues[i].split('=');
        if (nameAndValue.length == 2) {
          // set this as named
          namedValues[nameAndValue[0].trim()] = nameAndValue[1].trim();
        }
      }
    }
    */
  }

  /// Does this object has positional params?
  bool hasPositinalParams() {
    if (0 == positionalValues.length) {
      return false;
    } else {
      return true;
    }
  }

  /// Does this object has named params?
  bool hasNamedParams() {
    if (0 == namedValues.length) {
      return false;
    } else {
      return true;
    }
  }

  /// Does this object has any params?
  bool hasParams() {
    return hasPositinalParams() || hasNamedParams();
  }

  /// The first positional value
  String? first() {
    if (hasPositinalParams()) {
      return positionalValues[0];
    } else {
      return null;
    }
  }

  /// read value string if not ""
  Value readStr(String valueStr) {
    if ("" != valueStr) {
      var values = valueStr.split(',');
      for (var i = 0; i < values.length; i++) {
        values[i] = values[i].trim();

        // push to positional
        positionalValues.add(values[i]);

        var nameAndValue = positionalValues[i].split('=');
        if (nameAndValue.length == 2) {
          // set this as named
          namedValues[nameAndValue[0].trim()] = nameAndValue[1].trim();
        }
      }
    }

    return this;
  }
}
