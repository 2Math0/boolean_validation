import '../test_common_libs.dart';

void main() {
  group('SUPPORTED_LANGUAGE_UTILITIES', () {
    group('REGEX_BUILDER_FUNCTIONALITY', () {
      test('ALPHA_ONLY_REGEX_ENGLISH', () {
        final regex = SupportedLanguage.english.buildRegex(includeAlpha: true);
        final regExp = RegExp(regex);

        expect(regExp.hasMatch('Thomas'), true);
        expect(regExp.hasMatch('123'), false);
        expect(regExp.hasMatch('2Math0'), false);
      });

      test('ALPHA_NUM_REGEX_ENGLISH', () {
        final regex = SupportedLanguage.english.buildRegex(
          includeAlpha: true,
          includeNum: true,
        );
        final regExp = RegExp(regex);

        expect(regExp.hasMatch('Thomas'), true);
        expect(regExp.hasMatch('123'), true);
        expect(regExp.hasMatch('2Math0'), true);
        expect(regExp.hasMatch('@#\$'), false);
      });

      test('ALPHA_PUNCTUATION_REGEX_ENGLISH', () {
        final regex = SupportedLanguage.english.buildRegex(
          includeAlpha: true,
          includePunctuation: true,
        );
        final regExp = RegExp(regex);

        expect(regExp.hasMatch('Thomas'), true);
        expect(regExp.hasMatch("O'Connor"), true);
        expect(regExp.hasMatch('Mary-Jane'), true);
        expect(regExp.hasMatch('123'), false);
      });

      test('FULL_PATTERN_REGEX_ENGLISH', () {
        final regex = SupportedLanguage.english.fullPattern;
        final regExp = RegExp(regex);

        expect(regExp.hasMatch('Thomas'), true);
        expect(regExp.hasMatch('123'), true);
        expect(regExp.hasMatch("O'Connor"), true);
        expect(regExp.hasMatch('2Math0'), true);
      });

      test('ARABIC_ALPHA_REGEX', () {
        final regex = SupportedLanguage.arabic.buildRegex(includeAlpha: true);
        final regExp = RegExp(regex);

        expect(regExp.hasMatch('توماس'), true);
        expect(regExp.hasMatch('Thomas'), false);
        expect(regExp.hasMatch('123'), false);
      });

      test('ARABIC_ALPHA_NUM_REGEX', () {
        final regex = SupportedLanguage.arabic.buildRegex(
          includeAlpha: true,
          includeNum: true,
        );
        final regExp = RegExp(regex);

        expect(regExp.hasMatch('توماس'), true);
        expect(regExp.hasMatch('١٢٣'), true); // Arabic numerals
        expect(regExp.hasMatch('توماس١٢٣'), true);
        expect(regExp.hasMatch('123'), false); // Western numerals should fail
      });

      test('JAPANESE_COMPLEX_REGEX', () {
        final regex = SupportedLanguage.japanese.buildRegex(includeAlpha: true);
        final regExp = RegExp(regex);

        expect(regExp.hasMatch('たろう'), true); // Hiragana
        expect(regExp.hasMatch('タロウ'), true); // Katakana
        expect(regExp.hasMatch('太郎'), true); // Kanji
        expect(regExp.hasMatch('Thomas'), false);
      });

      test('EMPTY_REGEX_THROWS_ERROR', () {
        expect(
              () => SupportedLanguage.english.buildRegex(
            includeAlpha: false,
            includeNum: false,
            includePunctuation: false,
          ),
          throwsArgumentError,
        );
      });
    });

    group('COMPLEX_REGEX_BUILDER', () {
      test('BUILD_COMPLEX_OR_GROUPS', () {
        final patterns = RegexPatterns();
        final regex = patterns.buildFlexibleRegex(
          orGroups: [
            [
              SupportedLanguage.english.alphaPattern,
              SupportedLanguage.arabic.alphaPattern
            ],
            [SupportedLanguage.english.digitPattern],
          ],
        );

        final regExp = RegExp(regex);
        expect(regExp.hasMatch('Thomas'), true);
        expect(regExp.hasMatch('توماس'), true);
        expect(regExp.hasMatch('123'), true);
      });

      test('BUILD_COMPLEX_AND_GROUPS', () {
        final patterns = RegexPatterns();
        final regex = patterns.buildFlexibleRegex(
          andGroups: [
            [SupportedLanguage.english.alphaPattern],
            [SupportedLanguage.english.digitPattern],
          ],
        );

        final regExp = RegExp(regex);
        expect(regExp.hasMatch('2Math0'), true);
        expect(regExp.hasMatch('Thomas'), false);
        expect(regExp.hasMatch('123'), false);
      });

      test('BUILD_MIXED_OR_AND_GROUPS', () {
        final patterns = RegexPatterns();
        final regex = patterns.buildFlexibleRegex(
          orGroups: [
            [
              SupportedLanguage.english.alphaPattern,
              SupportedLanguage.arabic.alphaPattern
            ],
          ],
          andGroups: [
            [SupportedLanguage.english.digitPattern],
          ],
        );

        final regExp = RegExp(regex);
        expect(regExp.hasMatch('2Math0'), true);
        expect(regExp.hasMatch('توماس123'), true);
        expect(regExp.hasMatch('Thomas'), false);
        expect(regExp.hasMatch('توماس'), false);
      });
    });

    group('LANGUAGE_PATTERN_PROPERTIES', () {
      test('ALPHA_NUM_PROPERTY', () {
        final alphaNum = SupportedLanguage.english.alphaNum;
        final regExp = RegExp(alphaNum);

        expect(regExp.hasMatch('2Math0'), true);
        expect(regExp.hasMatch('Thomas'), true);
        expect(regExp.hasMatch('123'), true);
        expect(regExp.hasMatch('@#\$'), false);
      });

      test('ALPHA_PUNCTUATION_PROPERTY', () {
        final alphaPunctuation = SupportedLanguage.english.alphaPunctuation;
        if (alphaPunctuation != null) {
          final regExp = RegExp(alphaPunctuation);

          expect(regExp.hasMatch('Thomas'), true);
          expect(regExp.hasMatch("O'Connor"), true);
          expect(regExp.hasMatch('Mary-Jane'), true);
          expect(regExp.hasMatch('123'), false);
        }
      });

      test('DIGIT_PUNCTUATION_PROPERTY', () {
        final digitPunctuation = SupportedLanguage.english.digitPunctuation;
        if (digitPunctuation != null) {
          final regExp = RegExp(digitPunctuation);

          expect(regExp.hasMatch('123'), true);
          expect(regExp.hasMatch('1,234'), true);
          expect(regExp.hasMatch('Thomas'), false);
        }
      });

      test('FULL_PATTERN_PROPERTY', () {
        final fullPattern = SupportedLanguage.english.fullPattern;
        final regExp = RegExp(fullPattern);

        expect(regExp.hasMatch('Thomas'), true);
        expect(regExp.hasMatch('123'), true);
        expect(regExp.hasMatch("O'Connor"), true);
        expect(regExp.hasMatch('2Math0'), true);
      });

      test('NULL_PUNCTUATION_HANDLING', () {
        final lang = SupportedLanguage.latinExtended; // Has null punctuation
        expect(lang.alphaPunctuation, null);
        expect(lang.digitPunctuation, null);
        expect(lang.punctuationPattern, null);
      });
    });
  });
}
