import 'package:boolean_validation/src/validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final Validators validators = Validators();

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
