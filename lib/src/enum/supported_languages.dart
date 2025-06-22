import 'package:boolean_validation/src/core/extensions/string_extension.dart';
import 'package:boolean_validation/src/regex/langs/regex_nums.dart';
import 'package:boolean_validation/src/regex/langs/regex_alpha_lang.dart';
import 'package:boolean_validation/src/regex/langs/regex_punctuation.dart';
import 'package:boolean_validation/src/regex/langs/regex_script_component.dart';

enum SupportedLanguage {
  english(
    AlphaLangRegex.englishOnly,
    NumLangRegex.westernNums,
    PunctuationLangRegex.englishPunctuation,
  ),
  arabic(
    AlphaLangRegex.arabicOnly,
    NumLangRegex.arabicNums,
    PunctuationLangRegex.arabicPunctuation,
  ),
  german(
    AlphaLangRegex.germanOnly,
    NumLangRegex.westernNums,
    PunctuationLangRegex.germanPunctuation,
  ),
  latinExtended(
    AlphaLangRegex.latinExtended,
    NumLangRegex.westernNums,
    null,
  ),
  cyrillic(
    AlphaLangRegex.cyrillicOnly,
    NumLangRegex.westernNums,
    PunctuationLangRegex.cyrillicPunctuation,
  ),
  hebrew(
    AlphaLangRegex.hebrewOnly,
    NumLangRegex.westernNums,
    PunctuationLangRegex.hebrewPunctuation,
  ),
  devanagari(
    AlphaLangRegex.devanagariOnly,
    NumLangRegex.devanagariNums,
    PunctuationLangRegex.devanagariPunctuation,
  ),
  thai(
    AlphaLangRegex.thaiOnly,
    NumLangRegex.thaiNums,
    PunctuationLangRegex.thaiPunctuation,
  ),
  korean(
    AlphaLangRegex.koreanOnly,
    NumLangRegex.westernNums,
    PunctuationLangRegex.koreanPunctuation,
  ),
  malayalam(
    AlphaLangRegex.malayalamOnly,
    NumLangRegex.malayalamNums,
    PunctuationLangRegex.malayalamPunctuation,
  ),
  tamil(
    AlphaLangRegex.tamilOnly,
    NumLangRegex.tamilNums,
    PunctuationLangRegex.tamilPunctuation,
  ),
  telugu(
    AlphaLangRegex.teluguOnly,
    NumLangRegex.teluguNums,
    PunctuationLangRegex.teluguPunctuation,
  ),
  bengali(
    AlphaLangRegex.bengaliOnly,
    NumLangRegex.bengaliNums,
    PunctuationLangRegex.bengaliPunctuation,
  ),
  gujarati(
    AlphaLangRegex.gujaratiOnly,
    NumLangRegex.gujaratiNums,
    PunctuationLangRegex.gujaratiPunctuation,
  ),
  punjabi(
    AlphaLangRegex.punjabiOnly,
    NumLangRegex.punjabiNums,
    PunctuationLangRegex.punjabiPunctuation,
  ),
  amharic(
    AlphaLangRegex.amharicOnly,
    NumLangRegex.westernNums,
    null,
  ),
  armenian(
    AlphaLangRegex.armenianOnly,
    NumLangRegex.westernNums,
    null,
  ),
  georgian(
    AlphaLangRegex.georgianOnly,
    NumLangRegex.westernNums,
    null,
  ),
  greek(
    AlphaLangRegex.greekOnly,
    NumLangRegex.westernNums,
    PunctuationLangRegex.greekPunctuation,
  ),
  khmer(
    AlphaLangRegex.khmerOnly,
    NumLangRegex.khmerNums,
    PunctuationLangRegex.khmerPunctuation,
  ),
  lao(
    AlphaLangRegex.laoOnly,
    NumLangRegex.laoNums,
    PunctuationLangRegex.laoPunctuation,
  ),
  burmese(
    AlphaLangRegex.burmeseOnly,
    NumLangRegex.burmeseNums,
    PunctuationLangRegex.burmesePunctuation,
  ),

  // Japanese variants
  japaneseHiragana(
    AlphaLangRegex.japaneseHiragana,
    NumLangRegex.westernNums,
    PunctuationLangRegex.japanesePunctuation,
  ),
  japaneseKatakana(
    AlphaLangRegex.japaneseKatakana,
    NumLangRegex.westernNums,
    PunctuationLangRegex.japanesePunctuation,
  ),
  japaneseKanji(
    AlphaLangRegex.japaneseKanji,
    NumLangRegex.westernNums,
    PunctuationLangRegex.japanesePunctuation,
  ),
  japanese(
    AlphaLangRegex.japaneseOnly,
    NumLangRegex.westernNums,
    PunctuationLangRegex.japanesePunctuation,
    [
      ScriptComponentRegex.japaneseRadicals,
      PunctuationLangRegex.japaneseMiscSymbols,
      PunctuationLangRegex.japaneseHalfWidth,
      PunctuationLangRegex.japaneseFullWidthAlphaNum,
    ],
  ),
  ;

  final String alphaPattern;
  final String digitPattern;
  final String? punctuationPattern;
  final List<String> extraPatterns;

  const SupportedLanguage(
    this.alphaPattern,
    this.digitPattern, [
    this.punctuationPattern,
    this.extraPatterns = const [],
  ]);

  /// Access the alpha-numeric regex associated with this language.
  String get alphaNum => buildRegex(includeAlpha: true, includeNum: true);

  /// Combined letter + punctuation regex
  String? get alphaPunctuation => punctuationPattern == null
      ? null
      : buildRegex(includeAlpha: true, includePunctuation: true);

  /// Combined digit + punctuation regex
  String? get digitPunctuation => punctuationPattern == null
      ? null
      : buildRegex(
          includeAlpha: false, includeNum: true, includePunctuation: true);

  /// Combined letter + digit + punctuation regex
  String get fullPattern => buildRegex(
      includeAlpha: true,
      includeNum: true,
      includePunctuation: punctuationPattern != null);
}

extension SupportedLanguageRegexBuilder on SupportedLanguage {
  /// Builds a regex based on which components to include:
  /// [includeAlpha], [includeNum], [includePunctuation] — all optional.
  /// Anchors `^` and `$` are automatically added.
  String buildRegex({
    bool includeAlpha = true,
    bool includeNum = false,
    bool includePunctuation = false,
  }) {
    final parts = <String>[];

    if (includeAlpha) parts.add(alphaPattern.removeAnchors);
    if (includeNum) parts.add(digitPattern.removeAnchors);
    if (includePunctuation && punctuationPattern != null) {
      parts.add(punctuationPattern!.removeAnchors);
    }

    if (parts.isEmpty) {
      throw ArgumentError(
          'At least one of alpha, num, or punctuation must be included.');
    }

    return '^(${parts.join('|')})+\$';
  }
}
