import '../../test_common_libs.dart';

void main() {
  final validators = Validators();
  ValidationMessages.copyWith(useGenericRequiredMessage: false);
  final messages = ValidationMessages();

  group('Integer Validation', () {
    test('Valid Integer', () {
      expect(
        validators.dataType.validateInteger('42'),
        null,
      );
    });

    test('Empty Integer - Required', () {
      expect(
        validators.dataType.validateInteger(''),
        messages.numberRequired,
      );
    });

    test('Invalid Integer Value', () {
      expect(
        validators.dataType.validateInteger('abc'), // Invalid integer
        messages.invalidNumber,
      );
    });

    test('Null Integer - Required', () {
      expect(
        validators.dataType.validateInteger(null),
        messages.numberRequired,
      );
    });

    // Additional test for custom required message
    test('Custom Required Message', () {
      expect(
        validators.dataType.validateInteger(
          null,
          customRequiredMessage: 'Please provide a number',
        ),
        'Please provide a number',
      );
    });
  });
}
