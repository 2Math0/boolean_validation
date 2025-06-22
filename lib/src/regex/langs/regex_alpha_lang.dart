import 'package:boolean_validation/src/core/common_libs.dart';
import 'package:boolean_validation/src/regex_patterns.dart';

extension AlphaLangRegex on RegexPatterns {
  /// English letters (uppercase and lowercase only).
  static const String englishOnly = r'^[a-zA-Z]+$';

  /// Arabic letters only (Unicode: 0600–06FF).
  static const String arabicOnly = r'^[\u0600-\u06FF]+$';

  /// German letters including umlauts (ä, ö, ü) and ß (Unicode: 00C0–00FF).
  static const String germanOnly = r'^[a-zA-Z\u00C0-\u00FF]+$';

  /// Japanese Hiragana characters.
  /// Unicode range: U+3041–U+3096.
  static const String japaneseHiragana = r'^[\u3041-\u3096]+$';

  /// Japanese Katakana characters (Full-width).
  /// Unicode range: U+30A0–U+30FF.
  static const String japaneseKatakana = r'^[\u30A0-\u30FF]+$';

  /// Japanese Kanji characters (CJK Unified Ideographs).
  /// Unicode ranges:
  /// - CJK Extension A: U+3400–U+4DBF
  /// - Common Kanji: U+4E00–U+9FFF
  /// - Compatibility Ideographs: U+F900–U+FAFF
  static const String japaneseKanji =
      r'^[\u3400-\u4DBF\u4E00-\u9FFF\uF900-\uFAFF]+$';

  /// Combined Japanese letter regex including:
  /// - Hiragana: U+3041–U+3096
  /// - Katakana: U+30A0–U+30FF
  /// - Kanji (CJK Unified Ideographs): U+3400–U+4DBF, U+4E00–U+9FFF, U+F900–U+FAFF
  static const String japaneseOnly =
      r'^[\u3041-\u3096\u30A0-\u30FF\u3400-\u4DBF\u4E00-\u9FFF\uF900-\uFAFF]+$';

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

  /// Malayalam script (used in Kerala, India).
  /// Unicode: 0D00–0D7F.
  static const String malayalamOnly = r'^[\u0D00-\u0D7F]+$';

  /// Tamil script (used in India and Sri Lanka).
  /// Unicode: 0B80–0BFF.
  static const String tamilOnly = r'^[\u0B80-\u0BFF]+$';

  /// Telugu script (South India).
  /// Unicode: 0C00–0C7F.
  static const String teluguOnly = r'^[\u0C00-\u0C7F]+$';

  /// Bengali script.
  /// Unicode: 0980–09FF.
  static const String bengaliOnly = r'^[\u0980-\u09FF]+$';

  /// Gujarati script.
  /// Unicode: 0A80–0AFF.
  static const String gujaratiOnly = r'^[\u0A80-\u0AFF]+$';

  /// Punjabi (Gurmukhi script).
  /// Unicode: 0A00–0A7F.
  static const String punjabiOnly = r'^[\u0A00-\u0A7F]+$';

  /// Amharic (Ethiopian script).
  /// Unicode: 1200–137F.
  static const String amharicOnly = r'^[\u1200-\u137F]+$';

  /// Armenian script.
  /// Unicode: 0530–058F.
  static const String armenianOnly = r'^[\u0530-\u058F]+$';

  /// Georgian script.
  /// Unicode: 10A0–10FF.
  static const String georgianOnly = r'^[\u10A0-\u10FF]+$';

  /// Greek alphabet.
  /// Unicode: 0370–03FF.
  static const String greekOnly = r'^[\u0370-\u03FF]+$';

  /// Khmer script (Cambodia).
  /// Unicode: 1780–17FF.
  static const String khmerOnly = r'^[\u1780-\u17FF]+$';

  /// Lao script.
  /// Unicode: 0E80–0EFF.
  static const String laoOnly = r'^[\u0E80-\u0EFF]+$';

  /// Burmese (Myanmar script).
  /// Unicode: 1000–109F.
  static const String burmeseOnly = r'^[\u1000-\u109F]+$';

  /// Combined regex allowing only letter characters from all supported languages.
  /// Useful for global input validation without allowing spaces, numbers, or punctuation.
  static final String multiLangCombined = '^('
      '${englishOnly.removeAnchors}|'
      '${arabicOnly.removeAnchors}|'
      '${germanOnly.removeAnchors}|'
      '${japaneseOnly.removeAnchors}|'
      '${chineseOnly.removeAnchors}|'
      '${latinExtended.removeAnchors}|'
      '${cyrillicOnly.removeAnchors}|'
      '${hebrewOnly.removeAnchors}|'
      '${devanagariOnly.removeAnchors}|'
      '${thaiOnly.removeAnchors}|'
      '${koreanOnly.removeAnchors}|'
      '${malayalamOnly.removeAnchors}|'
      '${tamilOnly.removeAnchors}|'
      '${teluguOnly.removeAnchors}|'
      '${bengaliOnly.removeAnchors}|'
      '${gujaratiOnly.removeAnchors}|'
      '${punjabiOnly.removeAnchors}|'
      '${amharicOnly.removeAnchors}|'
      '${armenianOnly.removeAnchors}|'
      '${georgianOnly.removeAnchors}|'
      '${greekOnly.removeAnchors}|'
      '${khmerOnly.removeAnchors}|'
      '${laoOnly.removeAnchors}|'
      '${burmeseOnly.removeAnchors}'
      r')+$';
}
