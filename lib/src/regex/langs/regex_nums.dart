import 'package:boolean_validation/src/regex_patterns.dart';

extension NumLangRegex on RegexPatterns {
  /// Western (ASCII) digits 0–9
  static const String westernNums = '[0-9]';

  /// Arabic-Indic digits (٠١٢٣٤٥٦٧٨٩) — Unicode: 0660–0669
  static const String arabicNums = r'[\u0660-\u0669]';

  /// Devanagari digits — Unicode: 0966–096F
  static const String devanagariNums = r'[\u0966-\u096F]';

  /// Bengali digits — Unicode: 09E6–09EF
  static const String bengaliNums = r'[\u09E6-\u09EF]';

  /// Gurmukhi (Punjabi) digits — Unicode: 0A66–0A6F
  static const String punjabiNums = r'[\u0A66-\u0A6F]';

  /// Gujarati digits — Unicode: 0AE6–0AEF
  static const String gujaratiNums = r'[\u0AE6-\u0AEF]';

  /// Tamil digits — Unicode: 0BE6–0BEF
  static const String tamilNums = r'[\u0BE6-\u0BEF]';

  /// Telugu digits — Unicode: 0C66–0C6F
  static const String teluguNums = r'[\u0C66-\u0C6F]';

  /// Kannada digits — Unicode: 0CE6–0CEF
  static const String kannadaNums = r'[\u0CE6-\u0CEF]';

  /// Malayalam digits — Unicode: 0D66–0D6F
  static const String malayalamNums = r'[\u0D66-\u0D6F]';

  /// Thai digits — Unicode: 0E50–0E59
  static const String thaiNums = r'[\u0E50-\u0E59]';

  /// Lao digits — Unicode: 0ED0–0ED9
  static const String laoNums = r'[\u0ED0-\u0ED9]';

  /// Myanmar digits — Unicode: 1040–1049
  static const String burmeseNums = r'[\u1040-\u1049]';

  /// Khmer digits — Unicode: 17E0–17E9
  static const String khmerNums = r'[\u17E0-\u17E9]';
}
