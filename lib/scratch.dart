class TextThemeSingle {
  TextThemeSingle._();

  static final _instance = TextThemeSingle._();

  static String _context = "";

  setName(String name) {
    _context = name;
  }

  get getName {
    if (_context.isEmpty) {
      throw UnimplementedError("Name is not initialized");
    }
    return _context;
  }


  factory TextThemeSingle() {
    return _instance;
  }
}

void main() {
  final obj = TextThemeSingle().setName("name");
  final value = TextThemeSingle().getName;
  print("resp $value");
}
