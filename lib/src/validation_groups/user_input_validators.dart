import 'package:boolean_validation/src/enum/email_domains.dart';
import 'package:boolean_validation/src/enum/supported_languages.dart';
import 'package:boolean_validation/src/validation_groups/validation_common.dart';
import 'package:boolean_validation/src/validation_messages/message_replacements_keys.dart';
import 'package:boolean_validation/src/core/extensions/string_extension.dart';

class UserInputValidators extends ValidationCommon {
  /// Validates an email input.
  /// Returns an error message if invalid; otherwise, null.
  String? validateEmail(
    String? value, {
    bool isRequired = true,
    String? customRequiredMessage,
    String? customInvalidMessage,
  }) {
    if (value.nullOrEmpty && isRequired == false) return null;
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
    if (value.nullOrEmpty && isRequired == false) return null;
    var emailValidation = validateEmail(
      value,
      isRequired: isRequired,
      customInvalidMessage: customInvalidMessage,
      customRequiredMessage: customRequiredMessage,
    );
    if (emailValidation != null) return emailValidation;

    if (!validationLogic.isValidConstrainedEmail(
        value?.toLowerCase(), domain)) {
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
    if (value.nullOrEmpty && isRequired == false) return null;
    final requiredValidation = validateRequired(
      value: value,
      isRequired: isRequired,
      customMessage: customRequiredMessage,
      defaultMessage: messages.usernameRequired,
    );
    if (requiredValidation != null) return requiredValidation;

    if (value != null && !validationLogic.isValidUsername(value)) {
      return customInvalidMessage ?? messages.usernameInvalid;
    }
    return null;
  }

  /// Validates a full name (e.g., first and last name).
  ///
  /// - [isRequired]: If true, the field must not be empty.
  /// - [customRequiredMessage]: Custom error message for empty input.
  /// - [customInvalidMessage]: Custom error message for format issues.
  /// - [nameLength]: Minimum number of name parts required (e.g., 2 for first + last).
  /// - [multiLang]: Supported language alphabets.
  String? validateFullName(
    String? value, {
    bool isRequired = true,
    String? customRequiredMessage,
    String? customInvalidMessage,
    int nameLength = 2,
    List<SupportedLanguage> multiLang = const [SupportedLanguage.english],
  }) {
    if (value.nullOrEmpty && isRequired == false) return null;

    final requiredValidation = validateRequired(
      value: value,
      isRequired: isRequired,
      customMessage: customRequiredMessage,
      defaultMessage: messages.fullNameRequired,
    );
    if (requiredValidation != null) return requiredValidation;

    final trimmed = value!;
    if (trimmed != trimmed.trim()) {
      return customInvalidMessage ?? messages.nameMustBeAlphabetic;
    }
    if (trimmed.contains(RegExp(r'\s{2,}'))) {
      return customInvalidMessage ?? messages.nameMustBeAlphabetic;
    }

    // Split by single space
    final parts = trimmed.split(' ');
    if (parts.length < nameLength) {
      return customInvalidMessage ?? messages.fullNameInvalid;
    }

    for (var part in parts) {
      final cleanedPart =
          part.replaceAll(RegExp(r"[-']"), ''); // Allow apostrophes and hyphens
      if (!validationLogic.isAlpha(cleanedPart, multiLang: multiLang)) {
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
    if (value.nullOrEmpty && isRequired == false) return null;
    final requiredValidation = validateRequired(
      value: value,
      isRequired: isRequired,
      customMessage: customRequiredMessage,
      defaultMessage: messages.nameRequired,
    );
    if (requiredValidation != null) return requiredValidation;

    if (!validationLogic.isValidName(value, multiLang: multiLang)) {
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
    if (value.nullOrEmpty && isRequired == false) return null;
    final requiredValidation = validateRequired(
      value: value,
      isRequired: isRequired,
      customMessage: customRequiredMessage,
      defaultMessage: messages.mobileNumberRequired,
    );
    if (requiredValidation != null) return requiredValidation;

    if (!validationLogic.isCorrectMobileNumber(value, prefix)) {
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
    if (value.nullOrEmpty && isRequired == false) return null;
    final requiredValidation = validateRequired(
      value: value,
      isRequired: isRequired,
      customMessage: customRequiredMessage,
      defaultMessage: messages.creditCardRequired,
    );

    if (requiredValidation != null) return requiredValidation;

    if (value != null && !validationLogic.isValidCreditCard(value)) {
      return customInvalidMessage ?? messages.invalidCreditCard;
    }
    return null;
  }
}
