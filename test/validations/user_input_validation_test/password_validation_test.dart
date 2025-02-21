import 'package:boolean_validation/src/validation_messages/message_replacements_keys.dart';

import '../../test_common_libs.dart';

void main() {
  final Validators validators = Validators();
  final ValidationMessages messages = ValidationMessages();
  messages.copyWith(useGenericRequiredMessage: false);

  group('Password Validation', () {
    test('Valid Password', () {
      expect(
        validators.userInput.validatePassword('ValidPassword1!'),
        null,
      );
    });

    test('Invalid Password - Too Short', () {
      expect(
        validators.userInput.validatePassword('Short1!', minLength: 20),
        messages
            .formatMessage(message: messages.passwordMinLength, replacements: {
          MessageReplacementKeys.minLength: 20,
        }),
      );
    });

    test('Invalid Password - No Lowercase', () {
      expect(
        validators.userInput.validatePassword('INVALID_PASSWORD1'),
        messages.passwordLowercase,
      );
    });

    test('Invalid Password - No Uppercase', () {
      expect(
        validators.userInput.validatePassword('invalidpassword1!'),
        messages.passwordUppercase,
      );
    });

    test('Invalid Password - No Digit', () {
      expect(
        validators.userInput.validatePassword('InvalidPassword!'),
        messages.passwordDigit,
      );
    });

    test('Invalid Password - No Special Character', () {
      expect(
        validators.userInput.validatePassword('InvalidPassword1'),
        messages.passwordSpecialChar,
      );
    });

    test('Invalid Password - Empty', () {
      expect(
        validators.userInput.validatePassword('', minLength: 10),
        '${messages.formatMessage(message: messages.passwordMinLength, replacements: {
              MessageReplacementKeys.minLength: 10,
            })}\n${messages.passwordLowercase}\n${messages.passwordUppercase}\n${messages.passwordDigit}\n${messages.passwordSpecialChar}',
      );
    });
  });
}
