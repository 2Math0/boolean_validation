import 'package:boolean_validation/boolean_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final Validators validators = Validators();

  group('Mobile Number Validation Tests', () {
    Validators validators = Validators();
    const String required = 'Mobile number is required';
    const String enterValid = 'Please enter a valid mobile number';

    test('Valid mobile number', () {
      String? result = validators.validateMobileNumber(
        '+1234567890',
        required,
        enterValid,
      );
      expect(result, null);
    });

    test('Valid mobile number without country code', () {
      String? result = validators.validateMobileNumber(
        '1234567890',
        required,
        enterValid,
      );
      expect(result, null);
    });

    test('Valid mobile number with egp country code', () {
      String? result = validators.validateMobileNumber(
        '+201012345678',
        required,
        enterValid,
      );
      expect(result, null);
    });

    test('Invalid mobile number - too short', () {
      String? result = validators.validateMobileNumber(
        '12345',
        required,
        enterValid,
      );
      expect(result, enterValid);
    });

    test('Invalid mobile number - too long', () {
      String? result = validators.validateMobileNumber(
        '1234567890123456',
        required,
        enterValid,
      );
      expect(result, enterValid);
    });

    test('Invalid mobile number - alphanumeric', () {
      String? result = validators.validateMobileNumber(
        'abc1234567',
        required,
        enterValid,
      );
      expect(result, enterValid);
    });

    test('Empty mobile number', () {
      String? result = validators.validateMobileNumber(
        '',
        required,
        enterValid,
      );
      expect(result, required);
    });

    test('Null mobile number', () {
      String? result = validators.validateMobileNumber(
        null,
        required,
        enterValid,
      );
      expect(result, required);
    });
  });
}
