class Setting {
  Setting._();

  static final instance = Setting._();

  int numOfChar = 18;
  int numOfLine = 2;

  void setConfig(int numChar, numLine) {
    numOfChar = numChar;
    numOfLine = numLine;
  }
}
