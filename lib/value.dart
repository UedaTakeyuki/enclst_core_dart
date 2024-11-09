class Value {
  // positional values
  List<String> positionalValues = [];

  // named value
  Map<String, String> namedValues = {};

  // Default empty constructor
  Value() {}

  /// Constructor by String
  Value.byStr(String valueStr) {
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
  }
}
