import 'package:boolean_validation/src/annotation/experimental.dart';
import 'package:boolean_validation/src/core/common_libs.dart';
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
    if (value.nullOrEmpty && isRequired == false) return null;
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

  @UnderDevelopment()

  /// Validates if the input is a Decimal.
  /// Returns an error message if invalid; otherwise, null.
  String? validateDouble(
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
      defaultMessage: messages.doubleRequired,
    );
    if (requiredValidation != null) return requiredValidation;

    if (value != null && !validationLogic.isDouble(value)) {
      return customInvalidMessage ?? messages.invalidDouble;
    }
    return null;
  }

  @UnderDevelopment()

  /// Validates if the input is a Positive Number.
  /// Returns an error message if invalid; otherwise, null.
  String? validatePositiveNum(
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
    if (value.nullOrEmpty && isRequired == false) return null;
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
    if (value.nullOrEmpty && isRequired == false) return null;
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
    if (value.nullOrEmpty && isRequired == false) return null;
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

  /// Validates whether a string contains only **alphanumeric characters**
  /// based on specified language settings.
  ///
  /// Returns:
  /// - A localized or custom error message if validation fails.
  /// - `null` if the input is valid or not required.
  ///
  /// ### Parameters:
  /// - [value]: The input string to validate.
  /// - [isRequired]: If `true`, the field must be non-empty.
  /// Defaults to `true`.
  /// - [customRequiredMessage]: Optional custom message shown
  /// when the input is required but missing.
  /// - [customInvalidMessage]: Optional custom message shown
  /// when the input fails alphanumeric validation.
  /// - [multiLang]: List of supported languages
  /// whose alphabet and digit sets will be accepted.
  ///   Defaults to English. Multiple languages can be combined.
  /// - [mustContainAlpha]: If `true`,
  /// the string must contain at least one letter from the allowed language(s).
  /// - [mustContainDigit]: If `true`,
  /// the string must contain at least one digit.
  /// - [useDigitsOfMultiLang]: If `true`,
  /// allows digit characters specific to the selected [multiLang].
  ///   If `false`, only Western digits (`0-9`) are allowed.
  ///
  /// ### Example:
  /// ```dart
  /// validateAlphanumeric('Hello123'); // Valid
  /// validateAlphanumeric('مرحبا١٢٣', multiLang: [SupportedLanguage.arabic], useDigitsOfMultiLang: true); // Valid
  /// validateAlphanumeric('123!', mustContainAlpha: true); // Invalid
  /// ```
  ///
  /// This method combines both validation logic and error messaging
  /// for easier use in forms or custom fields.
  String? validateAlphanumeric(
    String? value, {
    bool isRequired = true,
    String? customRequiredMessage,
    String? customInvalidMessage,
    List<SupportedLanguage> multiLang = const [SupportedLanguage.english],
    bool mustContainAlpha = false,
    bool mustContainDigit = false,
    bool useDigitsOfMultiLang = false,
  }) {
    if (value.nullOrEmpty && isRequired == false) return null;
    final requiredValidation = validateRequired(
      value: value,
      isRequired: isRequired,
      customMessage: customRequiredMessage,
      defaultMessage: messages.alphaNumericRequired,
    );
    if (requiredValidation != null) return requiredValidation;

    if (!validationLogic.isAlphanumeric(
      value,
      multiLang: multiLang,
      mustContainAlpha: mustContainAlpha,
      mustContainDigit: mustContainDigit,
      useDigitsOfMultiLang: useDigitsOfMultiLang,
    )) {
      return customInvalidMessage ?? messages.alphaNumericInvalid;
    }
    return null;
  }
}
