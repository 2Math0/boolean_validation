import '../../test_common_libs.dart';

void main() {
  final Validators validators = Validators();

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
        'Number is required',
      );
    });

    test('Invalid Integer Value', () {
      expect(
        validators.dataType.validateInteger('abc'), // Invalid integer
        'Enter a valid number',
      );
    });

    test('Null Integer - Required', () {
      expect(
        validators.dataType.validateInteger(null),
        'Number is required',
      );
    });

    // Additional test for custom required message
    test('Custom Required Message', () {
      expect(
        validators.dataType.validateInteger(null,
            customRequiredMessage: 'Please provide a number'),
        'Please provide a number',
      );
    });
  });
}
