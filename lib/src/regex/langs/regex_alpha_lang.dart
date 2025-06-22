import 'package:boolean_validation/src/core/common_libs.dart';
import 'package:boolean_validation/src/regex_patterns.dart';

extension AlphaLangRegex on RegexPatterns {
  /// English letters (uppercase and lowercase only).
  static const String englishOnly = r'^[a-zA-Z]+$';

  /// Arabic letters only, excluding Arabic-Indic digits (U+0660–U+0669).
  /// Unicode range: 0600–065F, 0670–06FF.
  static const String arabicOnly = r'^[\u0600-\u065F\u0670-\u06FF]+$';

  /// German letters including umlauts and ß (Latin Extended-A).
  /// Still includes a-z, A-Z plus U+00C0–U+00FF.
  static const String germanOnly = r'^[a-zA-Z\u00C0-\u00FF]+$';

  /// Japanese Hiragana characters.
  /// Unicode range: U+3041–U+3096.
  static const String japaneseHiragana = r'^[\u3041-\u3096]+$';

  /// Japanese Katakana (full-width).
  static const String japaneseKatakana = r'^[\u30A0-\u30FF]+$';

  /// Japanese Kanji (Unified Ideographs + extensions + compatibility).
  /// Unicode ranges:
  /// - CJK Extension A: U+3400–U+4DBF
  /// - Common Kanji: U+4E00–U+9FFF
  /// - Compatibility Ideographs: U+F900–U+FAFF
  static const String japaneseKanji =
      r'^[\u3400-\u4DBF\u4E00-\u9FFF\uF900-\uFAFF]+$';

  /// Combined Japanese letter regex including:
  /// - Hiragana: U+3041–U+3096
  /// - Katakana: U+30A0–U+30FF
  /// - Kanji (CJK Unified Ideographs):
  /// U+3400–U+4DBF, U+4E00–U+9FFF, U+F900–U+FAFF
  static const String japaneseOnly =
      r'^[\u3041-\u3096\u30A0-\u30FF\u3400-\u4DBF\u4E00-\u9FFF\uF900-\uFAFF]+$';

  /// Chinese characters (CJK Unified Ideographs).
  /// Unicode range: 4E00–9FFF.
  static const String chineseOnly = r'^[\u4E00-\u9FFF]+$';

  /// Latin Extended characters
  /// (for many European languages like Polish, Czech, Romanian).
  /// Unicode: 0100–024F.
  static const String latinExtended = r'^[\u0100-\u024F]+$';

  /// Cyrillic characters (Russian, Ukrainian, Bulgarian, etc.).
  /// Unicode: 0400–04FF.
  static const String cyrillicOnly = r'^[\u0400-\u04FF]+$';

  /// Korean Hangul syllables.
  /// Unicode range: AC00–D7AF.
  static const String koreanOnly = r'^[\uAC00-\uD7AF]+$';

  /// Hebrew script (letters only).
  /// Avoiding niqqud and punctuation.
  static const String hebrewOnly = r'^[\u05D0-\u05EA]+$';

  /// Devanagari script (used in Hindi, Marathi).
  /// Excludes digits (U+0966–U+096F).
  static const String devanagariOnly = r'^[\u0900-\u0965\u0970-\u097F]+$';

  /// Thai letters only
  /// (excluding digits: U+0E50–U+0E59).
  static const String thaiOnly =
      r'^[\u0E01-\u0E2E\u0E30-\u0E3A\u0E40-\u0E4C\u0E4E-\u0E5B]+$';

  /// Malayalam letters (U+0D00–U+0D7F)
  /// excluding numerals (U+0D66–0D6F).
  static const String malayalamOnly = r'^[\u0D00-\u0D65\u0D70-\u0D7F]+$';

  /// Tamil letters excluding digits (U+0BE6–U+0BEF).
  /// Unicode: 0B80–0BFF.
  static const String tamilOnly = r'^[\u0B80-\u0BE5\u0BF0-\u0BFF]+$';

  /// Telugu letters
  /// excluding digits (U+0C66–U+0C6F).
  static const String teluguOnly = r'^[\u0C00-\u0C65\u0C70-\u0C7F]+$';

  /// Bengali letters only
  /// (U+0980–U+09FF, excluding U+09E6–09EF).
  static const String bengaliOnly = r'^[\u0980-\u09E5\u09F0-\u09FF]+$';

  /// Gujarati letters only
  /// (excluding U+0AE6–0AEF digits).
  static const String gujaratiOnly = r'^[\u0A80-\u0AE5\u0AF0-\u0AFF]+$';

  /// Punjabi
  /// (Gurmukhi letters only, excluding U+0A66–0A6F).
  static const String punjabiOnly = r'^[\u0A00-\u0A65\u0A70-\u0A7F]+$';

  /// Amharic (Ethiopic script).
  static const String amharicOnly = r'^[\u1200-\u137F]+$';

  /// Armenian script.
  /// Unicode: 0530–058F.
  static const String armenianOnly = r'^[\u0530-\u058F]+$';

  /// Georgian script.
  /// Unicode: 10A0–10FF.
  static const String georgianOnly = r'^[\u10A0-\u10FF]+$';

  /// Greek letters only.
  static const String greekOnly = r'^[\u0370-\u03FF]+$';

  /// Khmer script
  /// (excluding digits: U+17E0–U+17E9).
  static const String khmerOnly = r'^[\u1780-\u17DF\u17F0-\u17FF]+$';

  /// Lao script
  /// (excluding digits: U+0ED0–U+0ED9).
  static const String laoOnly = r'^[\u0E80-\u0ECF\u0EDA-\u0EFF]+$';

  /// Burmese
  /// (Myanmar script, excluding digits: U+1040–U+1049).
  static const String burmeseOnly = r'^[\u1000-\u103F\u1050-\u109F]+$';

  /// Combined regex allowing
  /// only letter characters from all supported languages.
  /// Useful for global input validation
  /// without allowing spaces, numbers, or punctuation.
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
