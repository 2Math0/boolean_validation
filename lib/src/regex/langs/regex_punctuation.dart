import 'package:boolean_validation/src/regex_patterns.dart';

extension PunctuationLangRegex on RegexPatterns {
  /// English punctuation marks.
  /// Covers ASCII punctuation range (common Western punctuation).
  static const String englishPunctuation =
      "[!\"#\$%&'()*+,-./:;<=>?@[\\]^_`{|}~]+\$";

  /// Arabic punctuation marks.
  /// Includes Arabic comma, semicolon, question mark, decimal separators, and end marks.
  static const String arabicPunctuation =
      r'^[\u060C\u061B\u061F\u066A-\u066D\u06D4]+$';

  /// German uses standard Latin punctuation, same as English.
  static const String germanPunctuation = englishPunctuation;

  /// Cyrillic punctuation.
  /// Covers general punctuation and supplemental punctuation used with Cyrillic scripts.
  static const String cyrillicPunctuation = r'^[\u2010-\u205E\u2E00-\u2E7F]+$';

  /// Hebrew punctuation.
  /// Includes maqaf, sof pasuq, and other traditional marks.
  static const String hebrewPunctuation = r'^[\u05BE\u05C0\u05C3\u05C6]+$';

  /// Devanagari punctuation.
  /// Includes danda (।) and double danda (॥), used in Hindi and Sanskrit.
  static const String devanagariPunctuation = r'^[\u0964\u0965\u0970]+$';

  /// Thai punctuation marks.
  /// Includes paiyannoi, repetition mark, and symbol marks.
  static const String thaiPunctuation = r'^[\u0E2F\u0E46\u0E4F\u0E5A\u0E5B]+$';

  /// Korean punctuation.
  /// General punctuation block and full-width punctuation.
  static const String koreanPunctuation = r'^[\u3000-\u303F\uFF01-\uFF5E]+$';

  /// Malayalam punctuation.
  /// Used for combining marks and rare signs.
  static const String malayalamPunctuation = r'^[\u0D4A-\u0D4F\u0D79]+$';

  /// Tamil punctuation marks.
  /// Includes Tamil number signs and rare punctuation characters.
  static const String tamilPunctuation = r'^[\u0B70\u0BF0-\u0BF8]+$';

  /// Telugu punctuation marks.
  static const String teluguPunctuation = r'^[\u0C70-\u0C7F]+$';

  /// Bengali punctuation.
  /// Includes currency signs and section marks.
  static const String bengaliPunctuation = r'^[\u0981\u09FB-\u09FE]+$';

  /// Gujarati punctuation.
  static const String gujaratiPunctuation = r'^[\u0AF0-\u0AFF]+$';

  /// Punjabi (Gurmukhi) punctuation marks.
  static const String punjabiPunctuation = r'^[\u0A70-\u0A74]+$';

  /// Greek punctuation.
  /// Includes Greek question mark and middle dot.
  static const String greekPunctuation = r'^[\u037E\u0387]+$';

  /// Khmer punctuation.
  /// Includes full stop, comma, question mark, and reiteration mark.
  static const String khmerPunctuation = r'^[\u17D4-\u17D6\u17D8-\u17DA]+$';

  /// Lao punctuation.
  static const String laoPunctuation = r'^[\u0EAF\u0E5A\u0E5B]+$';

  /// Burmese (Myanmar) punctuation.
  static const String burmesePunctuation = r'^[\u104A\u104B\u104C-\u104F]+$';

  /// Japanese punctuation symbols.
  /// Unicode range: U+3000–U+303F (general punctuation used in Japanese).
  static const String japanesePunctuation = r'^[\u3000-\u303F]+$';

  /// Japanese half-width punctuation (with Katakana).
  /// Unicode range: U+FF5F–U+FF9F.
  static const String japaneseHalfWidth = r'^[\uFF5F-\uFF9F]+$';

  /// Miscellaneous Japanese symbols and characters.
  /// Used in Japanese dates, counters, and annotated text.
  /// Unicode ranges: U+31F0–U+31FF, U+3220–U+3243, U+3280–U+337F.
  static const String japaneseMiscSymbols =
      r'^[\u31F0-\u31FF\u3220-\u3243\u3280-\u337F]+$';

  /// Japanese full-width punctuation (with alphanumeric).
  /// Unicode range: U+FF01–U+FF5E.
  static const String japaneseFullWidthAlphaNum = r'^[\uFF01-\uFF5E]+$';
}
