import 'package:flutter_test/flutter_test.dart';
import 'package:boolean_validation/boolean_validation.dart';

void main() {
  final Validators validators = Validators();

  group('Username Validation', () {
    test('Valid Username', () {
      expect(
        validators.validateUsername('username_123', 'Username is required', 'Invalid username'),
        null,
      );
    });

    test('Empty Username', () {
      expect(
        validators.validateUsername('', 'Username is required', 'Invalid username'),
        'Username is required',
      );
    });

    test('Invalid Username Format', () {
      expect(
        validators.validateUsername('a', 'Username is required', 'Invalid username'),
        'Invalid username',
      );
    });

    // Add more tests specific to username validation if needed
  });
}
