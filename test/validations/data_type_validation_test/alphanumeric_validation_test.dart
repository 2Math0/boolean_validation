import '../../test_common_libs.dart';

void main() {
  final validators = Validators();
  final messages = ValidationMessages();
  messages.copyWith(useGenericRequiredMessage: false);

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
}
