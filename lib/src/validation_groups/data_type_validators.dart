import 'package:boolean_validation/src/validation_groups/validation_common.dart';

class DataTypeValidators extends ValidationCommon {
  /// Validates if the input is an integer.
  /// Returns an error message if invalid; otherwise, null.
  String? validateInteger(
    String? value, {
    bool isRequired = true,
    String? customRequiredMessage,
  }) {
    if (isRequired && (value == null || value.isEmpty)) {
      return customRequiredMessage ?? 'Number is required';
    }
    if (value != null && !validationLogic.isInteger(value)) {
      return 'Enter a valid number';
    }
    return null;
  }

  /// Validates a URL.
  /// Returns an error message if invalid; otherwise, null.
  String? validateUrl(
    String value, {
    bool isRequired = true,
    String? customRequiredMessage,
    String? customInvalidMessage,
  }) {
    if (isRequired && value.isEmpty) {
      return customRequiredMessage ?? 'URL is required';
    }
    if (!validationLogic.isValidUrl(value)) {
      return customInvalidMessage ?? 'Please enter a valid URL';
    }
    return null;
  }

  /// Validates a date in the format YYYY-MM-DD.
  /// Returns an error message if invalid; otherwise, null.
  String? validateDate(
    String value, {
    bool isRequired = true,
    String? customRequiredMessage,
    String? customInvalidMessage,
  }) {
    if (isRequired && value.isEmpty) {
      return customRequiredMessage ?? 'Date is required';
    }
    if (!validationLogic.isValidDate(value)) {
      return customInvalidMessage ?? 'Please enter a valid date';
    }
    return null;
  }

  /// Validates a string to ensure it contains only alphabets.
  /// Returns an error message if invalid; otherwise, null.
  String? validateAlpha(
    String value, {
    bool isRequired = true,
    String? customRequiredMessage,
    String? customInvalidMessage,
  }) {
    if (isRequired && value.isEmpty) {
      return customRequiredMessage ?? 'This field is required.';
    }
    if (!validationLogic.isAlpha(value)) {
      return customInvalidMessage ?? 'This field must contain only alphabets.';
    }
    return null;
  }

  /// Validates a string to ensure it contains only alphanumeric characters.
  /// Returns an error message if invalid; otherwise, null.
  String? validateAlphanumeric(
    String value, {
    bool isRequired = true,
    String? customRequiredMessage,
    String? customInvalidMessage,
  }) {
    if (isRequired && value.isEmpty) {
      return customRequiredMessage ?? 'This field is required.';
    }
    if (!validationLogic.isAlphanumeric(value)) {
      return customInvalidMessage ??
          'This field must contain only alphanumeric characters.';
    }
    return null;
  }
}
