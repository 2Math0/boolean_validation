import '../../test_common_libs.dart';

void main() {
  final validators = Validators().userInput;
ValidationMessages.copyWith(useGenericRequiredMessage: false); final messages = ValidationMessages();

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
      const customMsg = 'Please provide a mobile number';
      expect(
        validators.validateMobileNumber(null, customRequiredMessage: customMsg),
        customMsg,
      );
    });
    test('InValid Egyptian Mobile Number (Internation dialing code)', () {
      expect(
        validators.validateMobileNumber(
          '11234567890',
          prefix: CountryPhonePattern.egypt.dialCode,
        ),
        messages.invalidMobileNumber,
      );
    });

    test('Valid Egyptian Mobile Number (Internation dialing code)', () {
      expect(
        validators.validateMobileNumber(
          '1234567890',
          prefix: CountryPhonePattern.egypt.dialCode,
        ),
        null,
      );
    });

    test('InValid Egyptian Mobile Number (Internation dialing code)', () {
      expect(
        validators.validateMobileNumber(
          '01734567890',
          prefix: CountryPhonePattern.egypt.dialCode,
        ),
        messages.invalidMobileNumber,
      );
    });

    test('Invalid Egyptian Mobile Number (Embedded Country code with (+) Sign)',
        () {
      expect(
        validators.validateMobileNumber(
          '+201734567890',
        ),
        null,
      );
    });

    test('Valid Egyptian Mobile Number (Embedded Country code)', () {
      expect(
        validators.validateMobileNumber(
          '201734567890',
        ),
        null,
      );
    });

    test('Valid Egyptian Mobile Number (With Spaces and Brackets)', () {
      expect(
        validators.validateMobileNumber(
          '(2017) 345-678-90',
        ),
        null,
      );
    });

    test('valid Egyptian Mobile Number (Country code)', () {
      expect(
        validators.validateMobileNumber(
          '1234567890',
          prefix: CountryPhonePattern.egypt.isoCode,
        ),
        null,
      );
    });
  });
}
