import 'package:boolean_validation/src/validation_groups/user_input_validators.dart';

import '../test_common_libs.dart';

void main() {
  final UserInputValidators validators = Validators().userInput;

  group('Credit Card Validation', () {
    test('Valid Credit Card', () {
      expect(
        validators.validateCreditCard('4111111111111111'),
        // Example valid card number
        null,
      );
    });

    test('Empty Credit Card - Required', () {
      expect(
        validators.validateCreditCard(''),
        'Credit card number is required',
      );
    });

    test('Invalid Credit Card Value', () {
      expect(
        validators.validateCreditCard('12345'), // Invalid card number
        'Please enter a valid credit card number',
      );
    });

    test('Null Credit Card - Required', () {
      expect(
        validators.validateCreditCard(''),
        'Credit card number is required',
      );
    });

    // Additional test for custom required message
    test('Custom Required Message', () {
      expect(
        validators.validateCreditCard('',
            customRequiredMessage: 'Please provide a credit card number'),
        'Please provide a credit card number',
      );
    });
  });
}
