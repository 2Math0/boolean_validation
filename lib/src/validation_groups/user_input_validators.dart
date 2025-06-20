import 'package:boolean_validation/src/enum/email_domains.dart';
import 'package:boolean_validation/src/enum/supported_languages.dart';
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
            MessageReplacementKeys.domain: domain.name,
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
  /// [nameLength] the required length of the Full Name
  String? validateFullName(
    String? value, {
    bool isRequired = true,
    String? customRequiredMessage,
    String? customInvalidMessage,
    int nameLength = 2,
    List<SupportedLanguage> multiLang = const [SupportedLanguage.english],
  }) {
    final requiredValidation = validateRequired(
      value: value,
      isRequired: isRequired,
      customMessage: customRequiredMessage,
      defaultMessage: messages.fullNameRequired,
    );
    if (requiredValidation != null) return requiredValidation;

    final parts = value!.split(' ');
    if (parts.length < nameLength) {
      return customInvalidMessage ?? messages.fullNameInvalid;
    }

    for (var part in parts) {
      if (!validationLogic.isAlpha(part, multiLang: multiLang)) {
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
    List<SupportedLanguage> multiLang = const [SupportedLanguage.english],
  }) {
    final requiredValidation = validateRequired(
      value: value,
      isRequired: isRequired,
      customMessage: customRequiredMessage,
      defaultMessage: messages.nameRequired,
    );
    if (requiredValidation != null) return requiredValidation;

    if (!validationLogic.isValidName(value!, multiLang: multiLang)) {
      return customInvalidMessage ?? messages.nameMustBeAlphabetic;
    }
    return null;
  }

  /// Validates a password with multiple rules.
  /// Returns an error message if invalid; otherwise, null.
  String? validatePassword(
    String? value, {
    int minLength = 8,
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
        message: messages.passwordMinLength,
        replacements: {MessageReplacementKeys.minLength: minLength},
      ));
    }
    if (requireUppercase && !validationLogic.containsLowerCase(value!)) {
      errors.add(customUppercaseMessage ?? messages.passwordLowercase);
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
    final requiredValidation = validateRequired(
      value: value,
      isRequired: isRequired,
      customMessage: customRequiredMessage,
      defaultMessage: messages.mobileNumberRequired,
    );
    if (requiredValidation != null) return requiredValidation;

    if (!validationLogic.isCorrectMobileNumber(value!, prefix)) {
      return customInvalidMessage ?? messages.invalidMobileNumber;
    }
    return null;
  }

  /// Validates a 16-digit credit card number using the Luhn algorithm.
  /// Returns an error message if invalid; otherwise, null.
  String? validateCreditCard(
    String? value, {
    bool isRequired = true,
    String? customRequiredMessage,
    String? customInvalidMessage,
  }) {
    final requiredValidation = validateRequired(
      value: value,
      isRequired: isRequired,
      customMessage: customRequiredMessage,
      defaultMessage: messages.creditCardRequired,
    );

    if (requiredValidation != null) return requiredValidation;

    if (!validationLogic.isValidCreditCard(value!)) {
      return customInvalidMessage ?? messages.invalidCreditCard;
    }
    return null;
  }
}
