import 'package:flutter_test/flutter_test.dart';
import 'package:boolean_validation/boolean_validation.dart';

void main() {
  final Validators validators = Validators();

  group('Date Validation', () {
    test('Valid Date', () {
      expect(
        validators.validateDate('2020-01-01', 'Date is required', 'Invalid date'),
        null,
      );
    });

    test('Empty Date', () {
      expect(
        validators.validateDate('', 'Date is required', 'Invalid date'),
        'Date is required',
      );
    });

    test('Invalid Date Format', () {
      expect(
        validators.validateDate('invaliddate', 'Date is required', 'Invalid date'),
        'Invalid date',
      );
    });

    // Add more tests specific to date validation if needed
  });
}
