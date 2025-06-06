import 'package:boolean_validation/src/regex/regex_alpha_lang.dart';

enum SupportedLanguage {
  english(AlphaLangRegex.englishOnly),
  arabic(AlphaLangRegex.arabicOnly),
  german(AlphaLangRegex.germanOnly),
  japanese(AlphaLangRegex.japaneseOnly),
  chinese(AlphaLangRegex.chineseOnly),
  latinExtended(AlphaLangRegex.latinExtended),
  cyrillic(AlphaLangRegex.cyrillicOnly),
  hebrew(AlphaLangRegex.hebrewOnly),
  devanagari(AlphaLangRegex.devanagariOnly),
  thai(AlphaLangRegex.thaiOnly),
  korean(AlphaLangRegex.koreanOnly);

  final String pattern;

  const SupportedLanguage(this.pattern);
}
