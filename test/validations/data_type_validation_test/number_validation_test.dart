import '../../test_common_libs.dart';

void main() {
  final validators = Validators().dataType;
  final messages = ValidationMessages();
  messages.copyWith(useGenericRequiredMessage: false);

  group('Integer Validation', () {
    test('Valid Integer', () {
      expect(
        validators.validateInteger('42'),
        null,
      );
    });

    test('Empty Integer - Required', () {
      expect(
        validators.validateInteger(''),
        messages.numberRequired,
      );
    });

    test('Invalid Integer Value', () {
      expect(
        validators.validateInteger('abc'), // Invalid integer
        messages.invalidNumber,
      );
    });

    test('Null Integer - Required', () {
      expect(
        validators.validateInteger(null),
        messages.numberRequired,
      );
    });

    // Additional test for custom required message
    test('Custom Required Message', () {
      const numberMsg = 'Please provide a number';
      expect(
        validators.validateInteger(null, customRequiredMessage: numberMsg),
        numberMsg,
      );
    });
  });

  group('Double Validation', () {
    test('Valid Double', () {
      expect(
        validators.validateDouble('3.14'),
        isNull,
      );
    });

    test('Invalid Double - Alpha', () {
      expect(
        validators.validateDouble('abc'),
        messages.invalidDouble,
      );
    });

    test('Empty Double - Required', () {
      expect(
        validators.validateDouble(''),
        messages.doubleRequired,
      );
    });

    test('Null Double - Required', () {
      expect(
        validators.validateDouble(null),
        messages.doubleRequired,
      );
    });

    test('Custom Required Message', () {
      const msg = 'Required value';
      expect(
        validators.validateDouble(null, customRequiredMessage: msg),
        msg,
      );
    });

    test('Custom Invalid Message', () {
      const msg = 'Double required';
      expect(
        validators.validateDouble('bad-input', customInvalidMessage: msg),
        msg,
      );
    });
  });

  group('Positive Number Validation', () {
    test('Valid Positive Integer', () {
      expect(
        validators.validatePositiveNum('12'),
        isNull,
      );
    });

    test('Valid Positive Double', () {
      expect(
        validators.validatePositiveNum('3.5'),
        isNull,
      );
    });

    test('Zero is Invalid', () {
      expect(
        validators.validatePositiveNum('0'),
        messages.invalidPositiveNum,
      );
    });

    test('Negative Number', () {
      expect(
        validators.validatePositiveNum('-8'),
        messages.invalidPositiveNum,
      );
    });

    test('Empty Input - Required', () {
      expect(
        validators.validatePositiveNum(''),
        messages.positiveNumRequired,
      );
    });

    test('Null Input - Required', () {
      expect(
        validators.validatePositiveNum(null),
        messages.positiveNumRequired,
      );
    });

    test('Invalid Format', () {
      expect(
        validators.validatePositiveNum('abc'),
        messages.invalidPositiveNum,
      );
    });

    test('Custom Invalid Message', () {
      expect(
        validators.validatePositiveNum(
          'abc',
          customInvalidMessage: 'Not a valid number',
        ),
        'Not a valid number',
      );
    });

    test('Custom Required Message', () {
      expect(
        validators.validatePositiveNum(
          null,
          customRequiredMessage: 'This field is required',
        ),
        'This field is required',
      );
    });

    test('Custom Must Be Positive Message', () {
      expect(
        validators.validatePositiveNum(
          '-5',
          customInvalidMessage: 'Should be above zero',
        ),
        'Should be above zero',
      );
    });
  });
}
