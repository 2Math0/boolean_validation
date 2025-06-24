import '../../test_common_libs.dart';

void main() {
  final validators = Validators();
  ValidationMessages.copyWith(useGenericRequiredMessage: false);
  final messages = ValidationMessages();

  group('Full Name Validation', () {
    test('Valid Full Name', () {
      expect(
        validators.userInput.validateFullName('Thomas Samy'),
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
