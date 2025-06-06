import 'package:boolean_validation/src/validation_groups/validation_common.dart';

  class LocationValidators extends ValidationCommon {
  /// Validates latitude.
  /// Returns an error message if invalid; otherwise, null.
  String? validateLat(
    String? value, {
    bool isRequired = true,
    String? customRequiredMessage,
    String? customInvalidMessage,
  }) {
    final requiredValidation = validateRequired(
      value: value,
      isRequired: isRequired,
      customMessage: customRequiredMessage,
      defaultMessage: messages.latitudeRequired,
    );
    if (requiredValidation != null) return requiredValidation;

    if (value != null && !validationLogic.isValidLatitude(value)) {
      return customInvalidMessage ?? messages.invalidLatitude;
    }
    return null;
  }

  /// Validates longitude.
  /// Returns an error message if invalid; otherwise, null.
  String? validateLong(
    String? value, {
    bool isRequired = true,
    String? customRequiredMessage,
    String? customInvalidMessage,
  }) {
    final requiredValidation = validateRequired(
      value: value,
      isRequired: isRequired,
      customMessage: customRequiredMessage,
      defaultMessage: messages.longitudeRequired,
    );
    if (requiredValidation != null) return requiredValidation;
    if (value != null && !validationLogic.isValidLongitude(value)) {
      return customInvalidMessage ?? messages.invalidLongitude;
    }
    return null;
  }
}
