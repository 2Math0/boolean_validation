import 'package:boolean_validation/src/validation_groups/validation_common.dart';

class DataTypeValidators extends ValidationCommon {
  /// Validates if the input is an integer.
  /// Returns an error message if invalid; otherwise, null.
  String? validateInteger(
    String? value, {
    bool isRequired = true,
    String? customRequiredMessage,
    String? customInvalidMessage,
  }) {
    final requiredValidation = validateRequired(
      value: value,
      isRequired: isRequired,
      customMessage: customRequiredMessage,
      defaultMessage: messages.numberRequired,
    );
    if (requiredValidation != null) return requiredValidation;

    if (value != null && !validationLogic.isInteger(value)) {
      return customInvalidMessage ?? messages.invalidNumber;
    }
    return null;
  }

  /// Validates a URL.
  /// Returns an error message if invalid; otherwise, null.
  String? validateUrl(
    String? value, {
    bool isRequired = true,
    String? customRequiredMessage,
    String? customInvalidMessage,
  }) {
    final requiredValidation = validateRequired(
      value: value,
      isRequired: isRequired,
      customMessage: customRequiredMessage,
      defaultMessage: messages.urlRequired,
    );
    if (requiredValidation != null) return requiredValidation;

    if (!validationLogic.isValidUrl(value!)) {
      return customInvalidMessage ?? messages.invalidUrl;
    }
    return null;
  }

  /// Validates a date in the format YYYY-MM-DD.
  /// Returns an error message if invalid; otherwise, null.
  String? validateDate(
    String? value, {
    bool isRequired = true,
    String? customRequiredMessage,
    String? customInvalidMessage,
  }) {
    final requiredValidation = validateRequired(
      value: value,
      isRequired: isRequired,
      customMessage: customRequiredMessage,
      defaultMessage: messages.dateRequired,
    );
    if (requiredValidation != null) return requiredValidation;

    if (!validationLogic.isValidDate(value!)) {
      return customInvalidMessage ?? messages.invalidDate;
    }
    return null;
  }

  /// Validates a string to ensure it contains only alphabets.
  /// Returns an error message if invalid; otherwise, null.
  String? validateAlpha(
    String? value, {
    bool isRequired = true,
    String? customRequiredMessage,
    String? customInvalidMessage,
  }) {
    final requiredValidation = validateRequired(
      value: value,
      isRequired: isRequired,
      customMessage: customRequiredMessage,
      defaultMessage: messages.alphaRequired,
    );
    if (requiredValidation != null) return requiredValidation;

    if (!validationLogic.isAlpha(value)) {
      return customInvalidMessage ?? messages.alphaInvalid;
    }
    return null;
  }

  /// Validates a string to ensure it contains only alphanumeric characters.
  /// Returns an error message if invalid; otherwise, null.
  String? validateAlphanumeric(
    String? value, {
    bool isRequired = true,
    String? customRequiredMessage,
    String? customInvalidMessage,
  }) {
    final requiredValidation = validateRequired(
      value: value,
      isRequired: isRequired,
      customMessage: customRequiredMessage,
      defaultMessage: messages.alphaNumericRequired,
    );
    if (requiredValidation != null) return requiredValidation;

    if (!validationLogic.isAlphanumeric(value)) {
      return customInvalidMessage ?? messages.alphaNumericInvalid;
    }
    return null;
  }
}
