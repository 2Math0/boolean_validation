import 'package:boolean_validation/boolean_validation.dart';

extension AlphaLangRegex on RegexPatterns {
  /// English letters (uppercase and lowercase only).
  static const String englishOnly = r'^[a-zA-Z]+$';

  /// Arabic letters only (Unicode: 0600–06FF).
  static const String arabicOnly = r'^[\u0600-\u06FF]+$';

  /// German letters including umlauts (ä, ö, ü) and ß (Unicode: 00C0–00FF).
  static const String germanOnly = r'^[a-zA-Z\u00C0-\u00FF]+$';

  /// Japanese characters: Hiragana, Katakana, and Kanji.
  /// Unicode ranges: 3040–30FF, 31F0–31FF, 4E00–9FFF.
  static const String japaneseOnly =
      r'^[\u3040-\u30FF\u31F0-\u31FF\u4E00-\u9FFF]+$';

  /// Chinese characters (CJK Unified Ideographs).
  /// Unicode range: 4E00–9FFF.
  static const String chineseOnly = r'^[\u4E00-\u9FFF]+$';

  /// Latin Extended characters (for many European languages like Polish, Czech, Romanian).
  /// Unicode: 0100–024F.
  static const String latinExtended = r'^[\u0100-\u024F]+$';

  /// Cyrillic characters (Russian, Ukrainian, Bulgarian, etc.).
  /// Unicode: 0400–04FF.
  static const String cyrillicOnly = r'^[\u0400-\u04FF]+$';

  /// Korean Hangul syllables.
  /// Unicode range: AC00–D7AF.
  static const String koreanOnly = r'^[\uAC00-\uD7AF]+$';

  /// Hebrew script only.
  /// Unicode range: 0590–05FF.
  static const String hebrewOnly = r'^[\u0590-\u05FF]+$';

  /// Devanagari script (used in Hindi, Marathi, Nepali).
  /// Unicode: 0900–097F.
  static const String devanagariOnly = r'^[\u0900-\u097F]+$';

  /// Thai script only.
  /// Unicode range: 0E00–0E7F.
  static const String thaiOnly = r'^[\u0E00-\u0E7F]+$';

  /// Combined regex allowing only letter characters from all supported languages,
  /// including English, Arabic, German, Japanese, Chinese, Cyrillic, Hebrew, etc.
  /// Useful for global input validation without allowing spaces, numbers, or punctuation.
  static final String multiLangCombined = '^('
      '${englishOnly.removeAnchors()}|'
      '${arabicOnly.removeAnchors()}|'
      '${germanOnly.removeAnchors()}|'
      '${japaneseOnly.removeAnchors()}|'
      '${chineseOnly.removeAnchors()}|'
      '${latinExtended.removeAnchors()}|'
      '${cyrillicOnly.removeAnchors()}|'
      '${hebrewOnly.removeAnchors()}|'
      '${devanagariOnly.removeAnchors()}|'
      '${thaiOnly.removeAnchors()}|'
      '${koreanOnly.removeAnchors()}'
      r')+$';
}
