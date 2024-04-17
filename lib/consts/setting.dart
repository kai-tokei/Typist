class Setting {
  Setting._();

  static final instance = Setting._();

  String fileName = "data";
  int numOfChar = 18;
  int numOfLine = 2;

  void setNumOfChar(int v) {
    numOfChar = v;
  }

  void setNumOfLine(int v) {
    numOfLine = v;
  }

  void setFileName(String v) {
    fileName = v;
  }
}
