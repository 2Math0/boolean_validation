import 'package:flutter_test/flutter_test.dart';
import 'package:boolean_validation/boolean_validation.dart';

void main() {
  final Validators validators = Validators();

  group('Credit Card Validation', () {
    test('Valid Credit Card', () {
      expect(
        validators.validateCreditCard('4111111111111111', 'Credit card number is required', 'Invalid credit card number'),
        null,
      );
    });

    test('Empty Credit Card', () {
      expect(
        validators.validateCreditCard('', 'Credit card number is required', 'Invalid credit card number'),
        'Credit card number is required',
      );
    });

    test('Invalid Credit Card Format', () {
      expect(
        validators.validateCreditCard('1234567890123456', 'Credit card number is required', 'Invalid credit card number'),
        'Invalid credit card number',
      );
    });

    // Add more tests specific to credit card validation if needed
  });
}
