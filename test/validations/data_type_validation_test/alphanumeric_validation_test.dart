import '../../test_common_libs.dart';

void main() {
  final validators = Validators();
  final messages = ValidationMessages();
  ValidationMessages.copyWith(useGenericRequiredMessage: false);

  group('Alphanumeric Validation', () {
    test('Valid Alphanumeric', () {
      expect(
        validators.dataType.validateAlphanumeric('Hello123'),
        null,
      );
    });

    test('Empty Alphanumeric - Required', () {
      expect(
        validators.dataType.validateAlphanumeric(''),
        messages.alphaNumericRequired,
      );
    });

    test('Invalid Alphanumeric Value', () {
      expect(
        validators.dataType.validateAlphanumeric('Hello@123'),
        // Invalid alphanumeric
        messages.alphaNumericInvalid,
      );
    });

    test('Null Alphanumeric - Required', () {
      expect(
        validators.dataType.validateAlphanumeric(null),
        messages.alphaNumericRequired,
      );
    });

    // Additional test for custom required message
    test('Custom Required Message', () {
      expect(
        validators.dataType.validateAlphanumeric(
          '',
          customRequiredMessage: 'Please provide a value',
        ),
        'Please provide a value',
      );
    });
  });

  group('Alphanumeric Validation — Edge & Locale Cases', () {
    test('Valid: Arabic and English mix with western and Arabic digits', () {
      expect(
        validators.dataType.validateAlphanumeric(
          'شsشيads123٢١٢',
          multiLang: [SupportedLanguage.arabic, SupportedLanguage.english],
          useDigitsOfMultiLang: true,
        ),
        null,
      );
    });

    test('Invalid: Contains punctuation in Arabic input', () {
      expect(
        validators.dataType.validateAlphanumeric(
          'شsشي؟123', // Arabic question mark
          multiLang: [SupportedLanguage.arabic, SupportedLanguage.english],
          useDigitsOfMultiLang: true,
        ),
        messages.alphaNumericInvalid,
      );
    });

    test('Invalid: Only digits but must contain alpha', () {
      expect(
        validators.dataType.validateAlphanumeric(
          '123456',
          mustContainAlpha: true,
        ),
        messages.alphaNumericInvalid,
      );
    });

    test('Invalid: Only letters but must contain digit', () {
      expect(
        validators.dataType.validateAlphanumeric(
          'Hello',
          mustContainDigit: true,
        ),
        messages.alphaNumericInvalid,
      );
    });

    test('Valid: Latin Extended + digits with localized digits enabled', () {
      expect(
        validators.dataType.validateAlphanumeric(
          'Čč123',
          multiLang: [SupportedLanguage.latinExtended],
          useDigitsOfMultiLang: true,
        ),
        null,
      );
    });

    test('Invalid: Cyrillic with unsupported symbols', () {
      expect(
        validators.dataType.validateAlphanumeric(
          'Привет!',
          multiLang: [SupportedLanguage.cyrillic],
        ),
        messages.alphaNumericInvalid,
      );
    });

    test('Valid: Japanese Hiragana and western digits', () {
      expect(
        validators.dataType.validateAlphanumeric(
          'あいう123',
          multiLang: [SupportedLanguage.japaneseHiragana],
        ),
        null,
      );
    });

    test('Invalid: Chinese with emoji', () {
      expect(
        validators.dataType.validateAlphanumeric(
          '你好😊123',
          multiLang: [SupportedLanguage.japaneseKanji],
        ),
        messages.alphaNumericInvalid,
      );
    });

    test('Valid: Khmer letters and Khmer digits', () {
      expect(
        validators.dataType.validateAlphanumeric(
          'សួស្តី៤៥៦',
          multiLang: [SupportedLanguage.khmer],
          useDigitsOfMultiLang: true,
        ),
        null,
      );
    });

    test('Invalid: Tamil input with Arabic digits (should not pass)', () {
      expect(
        validators.dataType.validateAlphanumeric(
          'வணக்கம்٢١٢',
          multiLang: [SupportedLanguage.tamil],
          useDigitsOfMultiLang: true,
        ),
        messages.alphaNumericInvalid,
      );
    });

    test('Arabic alphanumeric input without diacritics', () {
      expect(
        validators.dataType.validateAlphanumeric(
          'محمد123',
          multiLang: [SupportedLanguage.arabic],
          useDigitsOfMultiLang: false,
        ),
        null,
      );
    });

    test('Arabic alphanumeric input with diacritics', () {
      expect(
        validators.dataType.validateAlphanumeric(
          'مُحَمَّدٌ123',
          multiLang: [SupportedLanguage.arabic],
          useDigitsOfMultiLang: true,
        ),
        messages.alphaNumericInvalid,
      );
    });

    test('Valid: Greek with western digits, must contain both', () {
      expect(
        validators.dataType.validateAlphanumeric(
          'Αθήνα123',
          multiLang: [SupportedLanguage.greek],
          mustContainAlpha: true,
          mustContainDigit: true,
        ),
        null,
      );
    });

    test('Invalid: Only punctuation, not alphanumeric', () {
      expect(
        validators.dataType.validateAlphanumeric('.,!?'),
        messages.alphaNumericInvalid,
      );
    });

    test('Valid: Zero-width space is rejected', () {
      expect(
        validators.dataType.validateAlphanumeric('Hello\u200B123'),
        messages.alphaNumericInvalid,
      );
    });

    test('Valid: Bengali + Bengali digits, all localized', () {
      expect(
        validators.dataType.validateAlphanumeric(
          'হ্যালো১২৩',
          multiLang: [SupportedLanguage.bengali],
          useDigitsOfMultiLang: true,
        ),
        null,
      );
    });
  });
}
