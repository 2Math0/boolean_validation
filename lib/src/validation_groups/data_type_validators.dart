import 'package:boolean_validation/src/enum/supported_languages.dart';
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

  /// [Under_Development] <br/>
  /// Validates if the input is a Decimal.
  /// Returns an error message if invalid; otherwise, null.
  String? validateDouble(
    String? value, {
    bool isRequired = true,
    String? customRequiredMessage,
    String? customInvalidMessage,
  }) {
    final requiredValidation = validateRequired(
      value: value,
      isRequired: isRequired,
      customMessage: customRequiredMessage,
      defaultMessage: messages.doubleRequired,
    );
    if (requiredValidation != null) return requiredValidation;

    if (value != null && !validationLogic.isDouble(value)) {
      return customInvalidMessage ?? messages.invalidDouble;
    }
    return null;
  }

  /// [Under_Development] <br/>
  /// Validates if the input is a Positive Number.
  /// Returns an error message if invalid; otherwise, null.
  String? validatePositiveNum(
    String? value, {
    bool isRequired = true,
    String? customRequiredMessage,
    String? customInvalidMessage,
  }) {
    final requiredValidation = validateRequired(
      value: value,
      isRequired: isRequired,
      customMessage: customRequiredMessage,
      defaultMessage: messages.positiveNumRequired,
    );
    if (requiredValidation != null) return requiredValidation;

    if (value != null && !validationLogic.isPositiveNum(value)) {
      return customInvalidMessage ?? messages.invalidPositiveNum;
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
    List<SupportedLanguage> multiLang = const [SupportedLanguage.english],
  }) {
    final requiredValidation = validateRequired(
      value: value,
      isRequired: isRequired,
      customMessage: customRequiredMessage,
      defaultMessage: messages.alphaRequired,
    );
    if (requiredValidation != null) return requiredValidation;

    if (!validationLogic.isAlpha(value, multiLang: multiLang)) {
      return customInvalidMessage ?? messages.alphaInvalid;
    }
    return null;
  }

  /// Validates a string to ensure it contains only alphanumeric characters.
  /// Returns an error message if invalid; otherwise, null.
  String? validateAlphanumeric(String? value,
      {bool isRequired = true,
      String? customRequiredMessage,
      String? customInvalidMessage,
      List<SupportedLanguage> multiLang = const [SupportedLanguage.english]}) {
    final requiredValidation = validateRequired(
      value: value,
      isRequired: isRequired,
      customMessage: customRequiredMessage,
      defaultMessage: messages.alphaNumericRequired,
    );
    if (requiredValidation != null) return requiredValidation;

    if (!validationLogic.isAlphanumeric(value, multiLang: multiLang)) {
      return customInvalidMessage ?? messages.alphaNumericInvalid;
    }
    return null;
  }
}
