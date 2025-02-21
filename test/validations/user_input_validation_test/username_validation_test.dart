import '../../test_common_libs.dart';

void main() {
  final Validators validators = Validators();
  final ValidationMessages messages = ValidationMessages();
  messages.copyWith(useGenericRequiredMessage: false);

  group('Username Validation', () {
    test('Valid Username', () {
      expect(
        validators.userInput.validateUsername('valid_username123'),
        null,
      );
    });

    test('Empty Username - Required', () {
      expect(
        validators.userInput.validateUsername(''),
        'Username is required',
      );
    });

    test('Invalid Username - Too Short', () {
      expect(
        validators.userInput.validateUsername('abc'),
        'Username must be 4-20 characters long and can include letters, numbers, and underscores',
      );
    });

    test('Invalid Username - Too Long', () {
      expect(
        validators.userInput.validateUsername('a' * 21),
        'Username must be 4-20 characters long and can include letters, numbers, and underscores',
      );
    });
  });
}
