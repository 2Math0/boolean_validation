import '../../test_common_libs.dart';

void main() {
  final Validators validators = Validators();

  group('Name Validation', () {
    test('Valid Name', () {
      expect(
        validators.userInput.validateName('John Doe'),
        null,
      );
    });

    test('Empty Name - Required', () {
      expect(
        validators.userInput.validateName(''),
        'Name is required.',
      );
    });

    test('Invalid Name - Contains Numbers', () {
      expect(
        validators.userInput.validateName('John123'),
        'Name must contain only alphabets and spaces.',
      );
    });

    test('Invalid Name - Contains Special Characters', () {
      expect(
        validators.userInput.validateName('John! Doe'),
        'Name must contain only alphabets and spaces.',
      );
    });

    // Additional test for custom required message
    test('Custom Required Message', () {
      expect(
        validators.userInput.validateName('',
            customRequiredMessage: 'Please provide your name'),
        'Please provide your name',
      );
    });

    // Additional test for custom invalid message
    test('Custom Invalid Message', () {
      expect(
        validators.userInput.validateName('John123',
            customInvalidMessage: 'Invalid name format'),
        'Invalid name format',
      );
    });
  });
}
