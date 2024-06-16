import 'package:boolean_validation/boolean_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final Validators validators = Validators();

  group('Integer Validation', () {
    group('Integer Validation', () {
      test('Valid Integer', () {
        expect(
          validators.validateInteger('123', 'Number is required'),
          null,
        );
      });

      test('Empty Integer', () {
        expect(
          validators.validateInteger('', 'Number is required'),
          'Number is required',
        );
      });

      test('Non-Numeric Input', () {
        expect(
          validators.validateInteger('abc', 'Number is required'),
          'Enter a valid number',
        );
      });

      // Add more specific integer validation tests as needed
    });
  });

  // Add more tests specific to email validation if needed
}
