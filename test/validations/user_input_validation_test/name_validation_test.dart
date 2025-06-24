import '../../test_common_libs.dart';

void main() {
  final validators = Validators().userInput;
  ValidationMessages.copyWith(useGenericRequiredMessage: false);
  final messages = ValidationMessages();

  group('Name Validation', () {
    test('Valid Name', () {
      expect(
        validators.validateName('Thomas Meshail'),
        // because of the space
        messages.nameMustBeAlphabetic,
      );
    });

    test('Empty Name - Required', () {
      expect(
        validators.validateName(''),
        messages.nameRequired,
      );
    });

    test('Invalid Name - Contains Numbers', () {
      expect(
        validators.validateName('2Math'),
        messages.nameMustBeAlphabetic,
      );
    });

    test('Invalid Name - Contains Special Characters', () {
      expect(
        validators.validateName('Thomas! Meshail'),
        messages.nameMustBeAlphabetic,
      );
    });

    // Additional test for custom required message
    test('Custom Required Message', () {
      const nameMsg = 'Please provide your name';
      expect(
        validators.validateName('', customRequiredMessage: nameMsg),
        nameMsg,
      );
    });

    // Additional test for custom invalid message
    test('Custom Invalid Message', () {
      const invalidMsg = 'Invalid name format';
      expect(
        validators.validateName('TwoMath0', customInvalidMessage: invalidMsg),
        invalidMsg,
      );
    });
  });

  group('Language Alpha Validation', () {
    test('Default (English) - Valid single word', () {
      expect(
        validators.validateName('Thomas'),
        isNull,
      );
    });

    test('Arabic - Valid Arabic only', () {
      expect(
        validators.validateName('توماس', multiLang: [SupportedLanguage.arabic]),
        isNull,
      );
    });

    test('Arabic - Invalid with English letters', () {
      expect(
        validators
            .validateName('Thomas', multiLang: [SupportedLanguage.arabic]),
        messages.nameMustBeAlphabetic,
      );
    });

    test('German - Valid with umlaut', () {
      expect(
        validators
            .validateName('Müller', multiLang: [SupportedLanguage.german]),
        isNull,
      );
    });

    test('Japanese - Invalid with English', () {
      expect(
        validators
            .validateName('Yamada', multiLang: [SupportedLanguage.japanese]),
        messages.nameMustBeAlphabetic,
      );
    });

    test('Japanese - Valid Kana', () {
      expect(
        validators.validateName('やまだ', multiLang: [SupportedLanguage.japanese]),
        isNull,
      );
    });

    test('Multi-lang (English + Arabic) - Mixed valid', () {
      expect(
        validators.validateName(
          'Thomasتوماس',
          multiLang: [
            SupportedLanguage.english,
            SupportedLanguage.arabic,
          ],
        ),
        isNull,
      );
    });

    test('Korean - Valid Hangul', () {
      expect(
        validators.validateName('김민수', multiLang: [SupportedLanguage.korean]),
        isNull,
      );
    });

    test('Cyrillic - Valid name', () {
      expect(
        validators
            .validateName('Андрей', multiLang: [SupportedLanguage.cyrillic]),
        isNull,
      );
    });

    test('Cyrillic - Invalid with Latin', () {
      expect(
        validators
            .validateName('Andrey', multiLang: [SupportedLanguage.cyrillic]),
        messages.nameMustBeAlphabetic,
      );
    });

    test('Hebrew - Valid name', () {
      expect(
        validators.validateName('דוד', multiLang: [SupportedLanguage.hebrew]),
        isNull,
      );
    });

    test('MultiLang - Valid name', () {
      expect(
        validators.validateName(
          'דוד김민수АндрейThomasتوماس',
          multiLang: SupportedLanguage.values,
        ),
        isNull,
      );
    });
  });
}
