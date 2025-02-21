import 'package:boolean_validation/src/enum/email_domains.dart';
import 'package:boolean_validation/src/validation_messages/message_replacements_keys.dart';

import '../../test_common_libs.dart';

void main() {
  final Validators validators = Validators();
  final ValidationMessages messages = ValidationMessages();
  messages.copyWith(useGenericRequiredMessage: false);

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
        ValidationMessages().emailRequired,
      );
    });

    test('Invalid Email Format', () {
      expect(
        validators.userInput.validateEmail('invalid-email'),
        ValidationMessages().invalidEmail,
      );
    });

    test('Valid Constrained Email', () {
      expect(
        validators.userInput
            .validateConstrainedEmail('test@domain.com', domain: domain),
        null,
      );
    });

    test('Invalid Constrained Email', () {
      expect(
        validators.userInput
            .validateConstrainedEmail('test@other.com', domain: domain),
        messages.formatMessage(
            message: messages.emailDomainValidation,
            replacements: {
              MessageReplacementKeys.domain: domain.domain,
            }),
      );
    });

    test('Empty Constrained Email', () {
      expect(
        validators.userInput.validateConstrainedEmail('', domain: domain),
        messages.emailRequired,
      );
    });
  });
}
