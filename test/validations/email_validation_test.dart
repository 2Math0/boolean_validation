import 'package:flutter_test/flutter_test.dart';
import 'package:boolean_validation/boolean_validation.dart';

void main() {
  final Validators validators = Validators();

  group('Email Validation', () {
    test('Valid Email', () {
      expect(
        validators.validateEmail('test@example.com', 'Email is required', 'Invalid email'),
        null,
      );
    });

    test('Empty Email', () {
      expect(
        validators.validateEmail('', 'Email is required', 'Invalid email'),
        'Email is required',
      );
    });

    test('Invalid Email Format', () {
      expect(
        validators.validateEmail('invalidemail', 'Email is required', 'Invalid email'),
        'Invalid email',
      );
    });
  });

  // Add more tests specific to email validation if needed
}
