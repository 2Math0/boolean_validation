import 'package:boolean_validation/src/enum/email_domains.dart';
import '../../test_common_libs.dart ';

void main() {
  final Validators validators = Validators();
  EmailDomain domain = EmailDomain.custom('domain.com');

  group('Email Validation', () {
    test('Valid Email', () {
      expect(
        validators.userInput.validateEmail('test@example.com'),
        null,
      );
    });

    test('Empty Email - Required', () {
      expect(
        validators.userInput.validateEmail(''),
        'Must enter an email',
      );
    });

    test('Invalid Email Format', () {
      expect(
        validators.userInput.validateEmail('invalid-email'),
        'Please enter a valid email!',
      );
    });

    test('Valid Constrained Email', () {
      expect(
        validators.userInput
            .validateConstrainedEmail('test@domain.com', domain),
        null,
      );
    });

    test('Invalid Constrained Email', () {
      expect(
        validators.userInput.validateConstrainedEmail('test@other.com', domain),
        'Email must be a domain.com address.',
      );
    });

    test('Empty Constrained Email', () {
      expect(
        validators.userInput.validateConstrainedEmail('', domain),
        'Email is required.',
      );
    });
  });
}
