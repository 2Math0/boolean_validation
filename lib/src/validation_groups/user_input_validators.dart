import 'package:boolean_validation/src/enum/email_domains.dart';
import 'package:boolean_validation/src/is_valid.dart';

class UserInputValidators {
  final ValidationLogic _validationLogic = ValidationLogic();

  /// Validates an email input.
  /// Returns an error message if invalid; otherwise, null.
  String? validateEmail(
    String? value, {
    bool isRequired = true,
    String? customRequiredMessage,
    String? customInvalidMessage,
  }) {
    if (isRequired && (value == null || value.isEmpty)) {
      return customRequiredMessage ?? 'Must enter an email';
    }
    if (value != null && !_validationLogic.isValidEmail(value)) {
      return customInvalidMessage ?? 'Please enter a valid email!';
    }
    return null;
  }

  /// Validates constrained email and provides a detailed error message.
  /// This method returns a string message indicating the validation result.
  String? validateConstrainedEmail(String? value, EmailDomain domain) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    if (!_validationLogic.isValidEmail(value)) {
      return 'Email format is invalid.';
    }

    if (!_validationLogic.isValidConstrainedEmail(value, domain)) {
      return 'Email must be a ${domain.domain} address.';
    }

    return null;
  }

  /// Validates a username.
  /// Returns an error message if invalid; otherwise, null.
  String? validateUsername(
    String value, {
    bool isRequired = true,
    String? customRequiredMessage,
    String? customInvalidMessage,
  }) {
    if (isRequired && value.isEmpty) {
      return customRequiredMessage ?? 'Username is required';
    }
    if (!_validationLogic.isValidUsername(value)) {
      return customInvalidMessage ??
          'Username must be 4-20 characters long and can include letters, numbers, and underscores';
    }
    return null;
  }

  /// Validates a full name (first and last).
  /// Returns an error message if invalid; otherwise, null.
  /// Validates a full name.
  /// Returns an error message if invalid; otherwise, null.
  String? validateFullName(
    String fullName, {
    bool isRequired = true,
    String? customRequiredMessage,
    String? customInvalidMessage,
  }) {
    if (isRequired && fullName.isEmpty) {
      return customRequiredMessage ?? 'Full name is required.';
    }

    final parts = fullName.split(' ');
    if (parts.length < 2) {
      return customInvalidMessage ?? 'Please enter both first and last names.';
    }

    // Validate each part of the name
    for (var part in parts) {
      if (!_validationLogic.isAlpha(part)) {
        if (part == ' ') continue;
        return customInvalidMessage ?? 'Name must contains only alphabets.';
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
    if (isRequired && (value == null || value.isEmpty)) {
      return customRequiredMessage ?? 'Name is required.';
    }
    if (value != null && !_validationLogic.isValidName(value)) {
      return customInvalidMessage ?? 'Name must contain only alphabets';
    }
    return null;
  }

  /// Validates a password with multiple rules.
  /// Returns an error message if invalid; otherwise, null.
  String? validatePassword(
    String value, {
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

    if (value.length < minLength) {
      errors.add(customMinLengthMessage ??
          'Password must be at least $minLength characters long.');
    }
    if (requireUppercase && !_validationLogic.containsUppercase(value)) {
      errors.add(customUppercaseMessage ??
          'Password must contain at least one uppercase letter.');
    }
    if (requireDigit && !_validationLogic.containsDigits(value)) {
      errors.add(
          customDigitMessage ?? 'Password must contain at least one digit.');
    }
    if (requireSpecialChar &&
        !_validationLogic.containsSpecialCharacter(value)) {
      errors.add(customSpecialCharMessage ??
          'Password must contain at least one special character (!@#\$&*~).');
    }

    return errors.isNotEmpty ? errors.join('\n') : null;
  }
}
