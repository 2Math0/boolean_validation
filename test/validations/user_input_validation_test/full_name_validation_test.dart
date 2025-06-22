import '../../test_common_libs.dart';

void main() {
  final Validators validators = Validators();
  final ValidationMessages messages = ValidationMessages();
  messages.copyWith(useGenericRequiredMessage: false);

  group('Full Name Validation', () {
    test('Valid Full Name', () {
      expect(
        validators.userInput.validateFullName('John Doe'),
        null,
      );
    });

    test('Empty Full Name - Required', () {
      expect(
        validators.userInput.validateFullName(''),
        'Full name is required.',
      );
    });
  });
}
