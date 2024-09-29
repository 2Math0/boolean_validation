import 'package:boolean_validation/src/validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final Validators validators = Validators();

  group('Password Validation', () {
    test('Valid Password', () {
      expect(
        validators.userInput.validatePassword('ValidPassword1!'),
        null,
      );
    });

    test('Invalid Password - Too Short', () {
      expect(
        validators.userInput.validatePassword('Short1!'),
        'Password must be at least 8 characters long.',
      );
    });

    test('Invalid Password - No Uppercase', () {
      expect(
        validators.userInput.validatePassword('invalidpassword1!'),
        'Password must contain at least one uppercase letter.',
      );
    });

    test('Invalid Password - No Digit', () {
      expect(
        validators.userInput.validatePassword('InvalidPassword!'),
        'Password must contain at least one digit.',
      );
    });

    test('Invalid Password - No Special Character', () {
      expect(
        validators.userInput.validatePassword('InvalidPassword1'),
        'Password must contain at least one special character (!@#\$&*~).',
      );
    });
  });
}
