class Validators {
  static String? requiredField(String? value, String message) {
    if (value == null || value.trim().isEmpty) return message;
    return null;
  }

  static String? email(String? value) {
    final v = value?.trim() ?? '';
    if (v.isEmpty) return 'အီးမေးလ် ထည့်ပါ။';
    if (!v.contains('@')) return 'အီးမေးလ် ပုံစံ မမှန်ပါ။';
    return null;
  }
}
