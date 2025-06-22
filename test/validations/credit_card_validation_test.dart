import '../test_common_libs.dart';

void main() {
  final validators = Validators().userInput;
  final messages = ValidationMessages();
  messages.copyWith(useGenericRequiredMessage: false);

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
        messages.creditCardRequired,
      );
    });

    test('Invalid Credit Card Value', () {
      expect(
        validators.validateCreditCard('0'), // Invalid card number
        messages.invalidCreditCard,
      );
    });

    test('Null Credit Card - Required', () {
      expect(
        validators.validateCreditCard(null),
        messages.creditCardRequired,
      );
    });

    // Additional test for custom required message
    test('Custom Required Message', () {
      const customMsg = 'Please provide a credit card number';
      expect(
        validators.validateCreditCard('', customRequiredMessage: customMsg),
        customMsg,
      );
    });
  });
}
