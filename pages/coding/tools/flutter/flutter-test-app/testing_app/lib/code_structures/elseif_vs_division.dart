

int elseIfCode(int documentLength, defaultValue) {
  int result = defaultValue;

  if (documentLength <= 180) {
    result = 1;
  } else if (documentLength <= 280) {
    result = 2;
  } else if (documentLength <= 380) {
    result = 3;
  } else if (documentLength <= 480) {
    result = 4;
  } else if (documentLength <= 580) {
    result = 5;
  } else if (documentLength <= 680) {
    result = 6;
  }

  return result;
}

int truncatingDivision(int documentLength, defaultValue) {
  return min(defaultValue, documentLength ~/ 100);
}