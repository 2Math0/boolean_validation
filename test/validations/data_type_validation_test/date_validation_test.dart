import '../../test_common_libs.dart';

void main() {
  final Validators validators = Validators();

  group('Date Validation', () {
    test('Valid Date', () {
      expect(
        validators.dataType.validateDate('2024-09-29'),
        null,
      );
    });

    test('Empty Date - Required', () {
      expect(
        validators.dataType.validateDate(''),
        'Date is required',
      );
    });

    test('Invalid Date Format', () {
      expect(
        validators.dataType.validateDate('29-09-2024'), // Invalid date format
        'Please enter a valid date',
      );
    });

    test('Null Date - Required', () {
      expect(
        validators.dataType.validateDate(''),
        'Date is required',
      );
    });

    // Additional test for custom required message
    test('Custom Required Message', () {
      expect(
        validators.dataType
            .validateDate('', customRequiredMessage: 'Please provide a date'),
        'Please provide a date',
      );
    });
  });
}
