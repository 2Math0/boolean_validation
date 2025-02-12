import '../test_common_libs.dart';

void main() {
  final Validators validators = Validators();

  group('Mobile Number Validation', () {
    test('Valid Mobile Number', () {
      expect(
        validators.validateMobileNumber('1234567890'),
        null,
      );
    });

    test('Empty Mobile Number - Required', () {
      expect(
        validators.validateMobileNumber(''),
        'Mobile number is required',
      );
    });

    test('Invalid Mobile Number Value', () {
      expect(
        validators.validateMobileNumber('abc123'), // Invalid mobile number
        'Please enter a valid mobile number',
      );
    });

    test('Null Mobile Number - Required', () {
      expect(
        validators.validateMobileNumber(null),
        'Mobile number is required',
      );
    });

    // Additional test for custom required message
    test('Custom Required Message', () {
      expect(
        validators.validateMobileNumber(null,
            customRequiredMessage: 'Please provide a mobile number'),
        'Please provide a mobile number',
      );
    });
    test('unValid Egyptian Mobile Number (Internation dialing code)', () {
      expect(
        validators.validateMobileNumber('11234567890', prefix: '+20'),
        'Please enter a valid mobile number',
      );
    });
    test('valid Egyptian Mobile Number (Country code)', () {
      expect(
        validators.validateMobileNumber('01234567890', prefix: 'eg'),
        'Please enter a valid mobile number',
      );
    });
  });
}
