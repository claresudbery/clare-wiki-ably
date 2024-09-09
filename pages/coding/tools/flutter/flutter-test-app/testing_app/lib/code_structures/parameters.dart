
class ParameterPlayground {
  double x;
  double y;

  // Sets the x and y instance variables
  // before the constructor body runs.
  ParameterPlayground({this.x = 0.0, this.y = 0.0});

  void positionalParams(int param1, [Object? param2, Object? param3]) {
      x = x + param1;
  }

  void defaultPositionalParams(int param1, [int param2 = 3, int param3 = 4]) {
      x = x + param1;
  }

  void namedParams(int param1, {Object? param2, Object? param3}) {
      x = x + param1;
  }

  void defaultNamedParams(int param1, {int param2 = 3, int param3 = 4}) {
      x = x + param1;
  }

  void requiredNamedParams(int param1, {required param2, required param3}) {
      x = x + param1;
  }
}

void doStuff() {
  final thing = ParameterPlayground(y: 9);
  const param2 = 2;
  const param3 = 3;

  thing.positionalParams(0);
  thing.positionalParams(0, param2);
  thing.positionalParams(0, param2, param3);

  thing.defaultPositionalParams(0);
  thing.defaultPositionalParams(0, param2);
  thing.defaultPositionalParams(0, param2, param3);

  thing.namedParams(0);
  thing.namedParams(param3:param3, param2:param2, 0);
  thing.namedParams(param2:param2, 0, param3:param3);
  thing.namedParams(param3:param3, 0);

  thing.defaultNamedParams(0);
  thing.defaultNamedParams(param3:param3, param2:param2, 0);
  thing.defaultNamedParams(param2:param2, 0, param3:param3);
  thing.defaultNamedParams(param3:param3, 0);

  thing.requiredNamedParams(param3:param3, param2:param2, 0);
  thing.requiredNamedParams(param2:param2, 0, param3:param3);
}