import '../../test_common_libs.dart';

void main() {
  final Validators validators = Validators();
  final ValidationMessages messages = ValidationMessages();
  messages.copyWith(useGenericRequiredMessage: false);

  group('NAME_VALIDATION_CORE', () {
    group('SINGLE_NAME_BASIC_VALIDATION', () {
      test('VALID_ENGLISH_NAME', () {
        expect(
          validators.userInput.validateName('Thomas'),
          null,
        );
      });

      test('EMPTY_NAME_REQUIRED_TRUE', () {
        expect(
          validators.userInput.validateName(''),
          messages.nameRequired,
        );
      });

      test('EMPTY_NAME_REQUIRED_FALSE', () {
        expect(
          validators.userInput.validateName('', isRequired: false),
          null,
        );
      });

      test('NULL_NAME_REQUIRED_TRUE', () {
        expect(
          validators.userInput.validateName(null),
          messages.nameRequired,
        );
      });

      test('NULL_NAME_REQUIRED_FALSE', () {
        expect(
          validators.userInput.validateName(null, isRequired: false),
          null,
        );
      });

      test('WHITESPACE_ONLY_NAME', () {
        expect(
          validators.userInput.validateName('   '),
          messages.nameRequired,
        );
      });

      test('NUMERIC_NAME_REJECTED', () {
        expect(
          validators.userInput.validateName('123'),
          messages.nameMustBeAlphabetic,
        );
      });

      test('ALPHANUMERIC_NAME_REJECTED', () {
        expect(
          validators.userInput.validateName('2Math0'),
          messages.nameMustBeAlphabetic,
        );
      });

      test('SPECIAL_CHARACTERS_REJECTED', () {
        expect(
          validators.userInput.validateName('Thomas@'),
          messages.nameMustBeAlphabetic,
        );
      });

      test('CUSTOM_REQUIRED_MESSAGE', () {
        expect(
          validators.userInput.validateName(
            '',
            customRequiredMessage: 'Custom name required',
          ),
          'Custom name required',
        );
      });

      test('CUSTOM_INVALID_MESSAGE', () {
        expect(
          validators.userInput.validateName(
            '2Math0',
            customInvalidMessage: 'Custom invalid name',
          ),
          'Custom invalid name',
        );
      });
    });

    group('FULL_NAME_BASIC_VALIDATION', () {
      test('VALID_TWO_PART_NAME', () {
        expect(
          validators.userInput.validateFullName('Thomas Samy'),
          null,
        );
      });

      test('VALID_THREE_PART_NAME', () {
        expect(
          validators.userInput.validateFullName('Thomas Middle Samy'),
          null,
        );
      });

      test('SINGLE_NAME_REJECTED_DEFAULT_LENGTH', () {
        expect(
          validators.userInput.validateFullName('Thomas'),
          messages.fullNameInvalid,
        );
      });

      test('SINGLE_NAME_ACCEPTED_CUSTOM_LENGTH', () {
        expect(
          validators.userInput.validateFullName('Thomas', nameLength: 1),
          null,
        );
      });

      test('EMPTY_FULL_NAME_REQUIRED_TRUE', () {
        expect(
          validators.userInput.validateFullName(''),
          messages.fullNameRequired,
        );
      });

      test('EMPTY_FULL_NAME_REQUIRED_FALSE', () {
        expect(
          validators.userInput.validateFullName('', isRequired: false),
          null,
        );
      });

      test('NULL_FULL_NAME_REQUIRED_TRUE', () {
        expect(
          validators.userInput.validateFullName(null),
          messages.fullNameRequired,
        );
      });

      test('NULL_FULL_NAME_REQUIRED_FALSE', () {
        expect(
          validators.userInput.validateFullName(null, isRequired: false),
          null,
        );
      });

      test('NUMERIC_PART_IN_FULL_NAME_REJECTED', () {
        expect(
          validators.userInput.validateFullName('Thomas 123'),
          messages.nameMustBeAlphabetic,
        );
      });

      test('SPECIAL_CHAR_IN_FULL_NAME_REJECTED', () {
        expect(
          validators.userInput.validateFullName('Thomas Sam@'),
          messages.nameMustBeAlphabetic,
        );
      });

      test('MULTIPLE_SPACES_HANDLED', () {
        expect(
          validators.userInput.validateFullName('Thomas  Samy'),
          messages.nameMustBeAlphabetic,
        );
      });

      test('LEADING_TRAILING_SPACES', () {
        expect(
          validators.userInput.validateFullName(' Thomas Samy '),
          messages.nameMustBeAlphabetic,
        );
      });

      test('CUSTOM_NAME_LENGTH_REQUIREMENT', () {
        expect(
          validators.userInput.validateFullName('A B C', nameLength: 3),
          null,
        );
      });

      test('INSUFFICIENT_NAME_PARTS_CUSTOM_LENGTH', () {
        expect(
          validators.userInput.validateFullName('A B', nameLength: 3),
          messages.fullNameInvalid,
        );
      });

      test('CUSTOM_REQUIRED_MESSAGE_FULL_NAME', () {
        expect(
          validators.userInput.validateFullName(
            '',
            customRequiredMessage: 'Custom full name required',
          ),
          'Custom full name required',
        );
      });

      test('CUSTOM_INVALID_MESSAGE_FULL_NAME', () {
        expect(
          validators.userInput.validateFullName(
            'Thomas',
            customInvalidMessage: 'Custom invalid full name',
          ),
          'Custom invalid full name',
        );
      });
    });
  });

  group('MULTILINGUAL_NAME_VALIDATION', () {
    group('ARABIC_NAMES', () {
      test('VALID_ARABIC_SINGLE_NAME', () {
        expect(
          validators.userInput.validateName(
            'محمد',
            multiLang: [SupportedLanguage.arabic],
          ),
          null,
        );
      });

      test('VALID_ARABIC_FULL_NAME', () {
        expect(
          validators.userInput.validateFullName(
            'محمد أحمد',
            multiLang: [SupportedLanguage.arabic],
          ),
          null,
        );
      });

      test('ARABIC_WITH_ENGLISH_REJECTED_SINGLE_LANG', () {
        expect(
          validators.userInput.validateName(
            'محمدThomas',
            multiLang: [SupportedLanguage.arabic],
          ),
          messages.nameMustBeAlphabetic,
        );
      });

      test('ARABIC_WITH_NUMBERS_REJECTED', () {
        expect(
          validators.userInput.validateName(
            'محمد123',
            multiLang: [SupportedLanguage.arabic],
          ),
          messages.nameMustBeAlphabetic,
        );
      });
    });

    group('MIXED_LANGUAGE_SUPPORT', () {
      test('ARABIC_ENGLISH_MIXED_ALLOWED', () {
        expect(
          validators.userInput.validateName(
            'محمدThomas',
            multiLang: [SupportedLanguage.arabic, SupportedLanguage.english],
          ),
          null,
        );
      });

      test('ARABIC_ENGLISH_FULL_NAME_MIXED', () {
        expect(
          validators.userInput.validateFullName(
            'محمد Thomas',
            multiLang: [SupportedLanguage.arabic, SupportedLanguage.english],
          ),
          null,
        );
      });

      test('UNSUPPORTED_LANGUAGE_REJECTED', () {
        expect(
          validators.userInput.validateName(
            '中文',
            multiLang: [SupportedLanguage.english],
          ),
          messages.nameMustBeAlphabetic,
        );
      });
    });

    group('VARIOUS_LANGUAGE_SCRIPTS', () {
      test('VALID_CYRILLIC_NAME', () {
        expect(
          validators.userInput.validateName(
            'Иван',
            multiLang: [SupportedLanguage.cyrillic],
          ),
          null,
        );
      });

      test('VALID_HEBREW_NAME', () {
        expect(
          validators.userInput.validateName(
            'דוד',
            multiLang: [SupportedLanguage.hebrew],
          ),
          null,
        );
      });

      test('VALID_DEVANAGARI_NAME', () {
        expect(
          validators.userInput.validateName(
            'राम',
            multiLang: [SupportedLanguage.devanagari],
          ),
          null,
        );
      });

      test('VALID_THAI_NAME', () {
        expect(
          validators.userInput.validateName(
            'สมชาย',
            multiLang: [SupportedLanguage.thai],
          ),
          null,
        );
      });

      test('VALID_KOREAN_NAME', () {
        expect(
          validators.userInput.validateName(
            '김철수',
            multiLang: [SupportedLanguage.korean],
          ),
          null,
        );
      });

      test('VALID_JAPANESE_HIRAGANA_NAME', () {
        expect(
          validators.userInput.validateName(
            'たろう',
            multiLang: [SupportedLanguage.japaneseHiragana],
          ),
          null,
        );
      });

      test('VALID_JAPANESE_KATAKANA_NAME', () {
        expect(
          validators.userInput.validateName(
            'タロウ',
            multiLang: [SupportedLanguage.japaneseKatakana],
          ),
          null,
        );
      });

      test('VALID_JAPANESE_KANJI_NAME', () {
        expect(
          validators.userInput.validateName(
            '太郎',
            multiLang: [SupportedLanguage.japaneseKanji],
          ),
          null,
        );
      });

      test('VALID_FULL_JAPANESE_NAME', () {
        expect(
          validators.userInput.validateName(
            'たろうタロウ太郎',
            multiLang: [SupportedLanguage.japanese],
          ),
          null,
        );
      });
    });
  });

  group('PUNCTUATION_HANDLING', () {
    group('ENGLISH_PUNCTUATION', () {
      test('HYPHENATED_NAME_SHOULD_BE_VALID', () {
        expect(
          validators.userInput.validateName(
            'Mary-Jane',
            multiLang: [SupportedLanguage.english],
          ),
          messages.nameMustBeAlphabetic,
        );
      });

      test('APOSTROPHE_NAME_SHOULD_BE_INVALID', () {
        expect(
          validators.userInput.validateName(
            "O'Connor",
            multiLang: [SupportedLanguage.english],
          ),
          messages.nameMustBeAlphabetic,
        );
      });

      test('FULL_NAME_WITH_HYPHEN', () {
        expect(
          validators.userInput.validateFullName(
            'Mary-Jane Smith',
            multiLang: [SupportedLanguage.english],
          ),
          null,
        );
      });

      test('FULL_NAME_WITH_APOSTROPHE', () {
        expect(
          validators.userInput.validateFullName(
            "Thomas O'Connor",
            multiLang: [SupportedLanguage.english],
          ),
          null,
        );
      });
    });

    group('ARABIC_PUNCTUATION', () {
      test('ARABIC_NAME_WITH_PUNCTUATION', () {
        expect(
          validators.userInput.validateName(
            'محمد-أحمد',
            multiLang: [SupportedLanguage.arabic],
          ),
          messages.nameMustBeAlphabetic,
        );
      });
    });

    group('INVALID_PUNCTUATION', () {
      test('ENGLISH_NAME_WITH_INVALID_PUNCTUATION', () {
        expect(
          validators.userInput.validateName(
            'Thomas@Smith',
            multiLang: [SupportedLanguage.english],
          ),
          messages.nameMustBeAlphabetic,
        );
      });

      test('MULTIPLE_INVALID_PUNCTUATION', () {
        expect(
          validators.userInput.validateName(
            'Thomas#\$%Smith',
            multiLang: [SupportedLanguage.english],
          ),
          messages.nameMustBeAlphabetic,
        );
      });
    });
  });


  group('EDGE_CASES_AND_BOUNDARY_CONDITIONS', () {
    test('VERY_LONG_NAME', () {
      final longName = 'A' * 1000;
      expect(
        validators.userInput.validateName(longName),
        null,
      );
    });

    test('VERY_LONG_FULL_NAME', () {
      final longName = 'A' * 500;
      expect(
        validators.userInput.validateFullName('$longName $longName'),
        null,
      );
    });

    test('SINGLE_CHARACTER_NAME', () {
      expect(
        validators.userInput.validateName('A'),
        null,
      );
    });

    test('MAXIMUM_NAME_PARTS', () {
      final manyParts = List.filled(10, 'Name').join(' ');
      expect(
        validators.userInput.validateFullName(manyParts),
        null,
      );
    });

    test('ZERO_NAME_LENGTH_REQUIREMENT', () {
      expect(
        validators.userInput
            .validateFullName('', nameLength: 0, isRequired: false),
        null,
      );
    });

    test('NEGATIVE_NAME_LENGTH_REQUIREMENT', () {
      expect(
        validators.userInput.validateFullName('Thomas Meshail', nameLength: -1),
        null,
      );
    });
  });
}
