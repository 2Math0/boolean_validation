import 'package:boolean_validation/src/validation_groups/user_input_validators.dart';

import '../test_common_libs.dart';

void main() {
  final UserInputValidators validators = Validators().userInput;
  final ValidationMessages messages = ValidationMessages();
  messages.copyWith(useGenericRequiredMessage: false);

  group('Mobile Number Validation', () {
    test('Valid Mobile Number', () {
      expect(
        validators.validateMobileNumber('12345678900'),
        null,
      );
    });

    test('Empty Mobile Number - Required', () {
      expect(
        validators.validateMobileNumber(''),
        messages.mobileNumberRequired,
      );
    });

    test('Invalid Mobile Number Value', () {
      expect(
        validators.validateMobileNumber('abc12345'), // Invalid mobile number
        messages.invalidMobileNumber,
      );
    });

    test('Null Mobile Number - Required', () {
      expect(
        validators.validateMobileNumber(null),
        messages.mobileNumberRequired,
      );
    });

    // Additional test for custom required message
    test('Custom Required Message', () {
      var customMsg = 'Please provide a mobile number';
      expect(
        validators.validateMobileNumber(null, customRequiredMessage: customMsg),
        customMsg,
      );
    });
    test('InValid Egyptian Mobile Number (Internation dialing code)', () {
      expect(
        validators.validateMobileNumber('11234567890', prefix: '+20'),
        messages.invalidMobileNumber,
      );
    });

    test('Valid Egyptian Mobile Number (Internation dialing code)', () {
      expect(
        validators.validateMobileNumber('01234567890', prefix: '+20'),
        null,
      );
    });

    test('valid Egyptian Mobile Number (Country code)', () {
      expect(
        validators.validateMobileNumber('01234567890', prefix: 'eg'),
        null,
      );
    });
  });
}
