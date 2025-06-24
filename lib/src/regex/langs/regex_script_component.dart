import 'package:boolean_validation/src/regex_patterns.dart';

/// These are not standalone letters, punctuation, or digits,
/// but structural or phonetic components used in constructing characters
/// in scripts like Japanese, Chinese, and others.
extension ScriptComponentRegex on RegexPatterns {
  /// Japanese Radicals (used to form Kanji characters).
  /// Unicode range: U+2E80–U+2FD5.
  static const String japaneseRadicals = r'^[\u2E80-\u2FD5]+$';

  /// CJK Strokes (used in Chinese character stroke dictionaries).
  /// Unicode range: U+31C0–U+31EF.
  static const String cjkStrokes = r'^[\u31C0-\u31EF]+$';

  /// CJK Compatibility Ideograph Components.
  /// Unicode range: U+2F00–U+2FDF.
  static const String cjkCompatibilityIdeographs = r'^[\u2F00-\u2FDF]+$';

  /// Bopomofo (Zhuyin) - Phonetic notation for Chinese (used in Taiwan).
  /// Unicode range: U+3100–U+312F.
  static const String bopomofo = r'^[\u3100-\u312F]+$';

  /// Bopomofo Extended.
  /// Unicode range: U+31A0–U+31BF.
  static const String bopomofoExtended = r'^[\u31A0-\u31BF]+$';

  /// Kanbun annotation characters (used for classical Chinese texts).
  /// Unicode range: U+3190–U+319F.
  static const String kanbun = r'^[\u3190-\u319F]+$';

  /// Enclosed CJK Letters and Months (used in Japanese, Chinese, Korean).
  /// Unicode range: U+3200–U+32FF.
  static const String enclosedCjkLetters = r'^[\u3200-\u32FF]+$';
}
