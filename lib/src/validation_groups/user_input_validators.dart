import 'package:boolean_validation/src/enum/email_domains.dart';
import 'package:boolean_validation/src/validation_groups/validation_common.dart';
import 'package:boolean_validation/src/validation_messages/message_replacements_keys.dart';

class UserInputValidators extends ValidationCommon {
  /// Validates an email input.
  /// Returns an error message if invalid; otherwise, null.
  String? validateEmail(
    String? value, {
    bool isRequired = true,
    String? customRequiredMessage,
    String? customInvalidMessage,
  }) {
    final requiredValidation = validateRequired(
      value: value,
      isRequired: isRequired,
      customMessage: customRequiredMessage,
      defaultMessage: messages.emailRequired,
    );
    if (requiredValidation != null) return requiredValidation;

    if (!validationLogic.isValidEmail(value)) {
      return customInvalidMessage ?? messages.invalidEmail;
    }

    return null;
  }

  /// Validates constrained email and provides a detailed error message.
  /// This method returns a string message indicating the validation result.
  String? validateConstrainedEmail(
    String? value, {
    required EmailDomain domain,
    bool isRequired = true,
    String? customRequiredMessage,
    String? customInvalidMessage,
  }) {
    var emailValidation = validateEmail(
      value,
      isRequired: isRequired,
      customInvalidMessage: customInvalidMessage,
      customRequiredMessage: customRequiredMessage,
    );
    if (emailValidation != null) return emailValidation;

    if (!validationLogic.isValidConstrainedEmail(value, domain)) {
      return messages.formatMessage(
          message: messages.emailDomainValidation,
          replacements: {
            MessageReplacementKeys.domain: domain.domain,
          });
    }

    return null;
  }

  /// Validates a username.
  /// Returns an error message if invalid; otherwise, null.
  String? validateUsername(
    String? value, {
    bool isRequired = true,
    String? customRequiredMessage,
    String? customInvalidMessage,
  }) {
    final requiredValidation = validateRequired(
      value: value,
      isRequired: isRequired,
      customMessage: customRequiredMessage,
      defaultMessage: messages.usernameRequired,
    );
    if (requiredValidation != null) return requiredValidation;

    if (!validationLogic.isValidUsername(value!)) {
      return customInvalidMessage ?? messages.usernameInvalid;
    }
    return null;
  }

  /// Validates a full name (first and last).
  /// Returns an error message if invalid; otherwise, null.
  /// Validates a full name.
  /// Returns an error message if invalid; otherwise, null.
  String? validateFullName(
    String? fullName, {
    bool isRequired = true,
    String? customRequiredMessage,
    String? customInvalidMessage,
  }) {
    final requiredValidation = validateRequired(
      value: fullName,
      isRequired: isRequired,
      customMessage: customRequiredMessage,
      defaultMessage: messages.fullNameRequired,
    );
    if (requiredValidation != null) return requiredValidation;

    final parts = fullName!.split(' ');
    if (parts.length < 2) {
      return customInvalidMessage ?? messages.fullNameInvalid;
    }

    for (var part in parts) {
      if (!validationLogic.isAlpha(part)) {
        return customInvalidMessage ?? messages.nameMustBeAlphabetic;
      }
    }

    return null;
  }

  /// Validates a name ensuring it only contains alphabets.
  String? validateName(
    String? value, {
    bool isRequired = true,
    String? customRequiredMessage,
    String? customInvalidMessage,
  }) {
    final requiredValidation = validateRequired(
      value: value,
      isRequired: isRequired,
      customMessage: customRequiredMessage,
      defaultMessage: messages.nameRequired,
    );
    if (requiredValidation != null) return requiredValidation;

    if (!validationLogic.isValidName(value!)) {
      return customInvalidMessage ?? messages.nameMustBeAlphabetic;
    }
    return null;
  }

  /// Validates a password with multiple rules.
  /// Returns an error message if invalid; otherwise, null.
  String? validatePassword(
    String? value, {
    int minLength = 8,
    String? customMinLengthMessage,
    bool requireUppercase = true,
    String? customUppercaseMessage,
    bool requireDigit = true,
    String? customDigitMessage,
    bool requireSpecialChar = true,
    String? customSpecialCharMessage,
  }) {
    List<String> errors = [];

    if (value == null || value.length < minLength) {
      errors.add(messages.formatMessage(
        message: customMinLengthMessage ?? messages.passwordMinLength,
        replacements: {MessageReplacementKeys.minLength: minLength},
      ));
    }
    if (requireUppercase && !validationLogic.containsUppercase(value!)) {
      errors.add(customUppercaseMessage ?? messages.passwordUppercase);
    }
    if (requireDigit && !validationLogic.containsDigits(value!)) {
      errors.add(customDigitMessage ?? messages.passwordDigit);
    }
    if (requireSpecialChar &&
        !validationLogic.containsSpecialCharacter(value!)) {
      errors.add(customSpecialCharMessage ?? messages.passwordSpecialChar);
    }

    return errors.isNotEmpty ? errors.join('\n') : null;
  }

  /// Validates a mobile number.
  /// Returns an error message if invalid; otherwise, null.
  String? validateMobileNumber(
    String? value, {
    bool isRequired = true,
    String? prefix,
    String? customRequiredMessage,
    String? customInvalidMessage,
  }) {
    return validateRequired(
          value: value,
          isRequired: isRequired,
          customMessage: customRequiredMessage,
          defaultMessage: messages.mobileNumberRequired,
        ) ??
        (!validationLogic.isCorrectMobileNumber(value!, prefix)
            ? customInvalidMessage ?? messages.invalidMobileNumber
            : null);
  }

  /// Validates a 16-digit credit card number using the Luhn algorithm.
  /// Returns an error message if invalid; otherwise, null.
  String? validateCreditCard(
    String? value, {
    bool isRequired = true,
    String? customRequiredMessage,
    String? customInvalidMessage,
  }) {
    return validateRequired(
          value: value,
          isRequired: isRequired,
          customMessage: customRequiredMessage,
          defaultMessage: messages.creditCardRequired,
        ) ??
        (!validationLogic.isValidCreditCard(value!)
            ? customInvalidMessage ?? messages.invalidCreditCard
            : null);
  }
}
