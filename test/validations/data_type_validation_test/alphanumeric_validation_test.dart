import '../../test_common_libs.dart';

void main() {
  final Validators validators = Validators();

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
        'This field is required.',
      );
    });

    test('Invalid Alphanumeric Value', () {
      expect(
        validators.dataType.validateAlphanumeric('Hello@123'),
        // Invalid alphanumeric
        'This field must contain only alphanumeric characters.',
      );
    });

    test('Null Alphanumeric - Required', () {
      expect(
        validators.dataType.validateAlphanumeric(''),
        'This field is required.',
      );
    });

    // Additional test for custom required message
    test('Custom Required Message', () {
      expect(
        validators.dataType.validateAlphanumeric('',
            customRequiredMessage: 'Please provide a value'),
        'Please provide a value',
      );
    });
  });
}
