import 'package:boolean_validation/src/is_valid.dart';

class LocationValidators {
  final ValidationLogic _validationLogic = ValidationLogic();

  /// Validates latitude.
  /// Returns an error message if invalid; otherwise, null.
  String? validateLat(
    String? value, {
    bool isRequired = true,
    String? customRequiredMessage,
  }) {
    if (isRequired && (value == null || value.isEmpty)) {
      return customRequiredMessage ?? 'Latitude is required';
    }
    if (value != null && !_validationLogic.isValidLatitude(value)) {
      return 'Invalid latitude value';
    }
    return null;
  }

  /// Validates longitude.
  /// Returns an error message if invalid; otherwise, null.
  String? validateLong(
    String? value, {
    bool isRequired = true,
    String? customRequiredMessage,
  }) {
    if (isRequired && (value == null || value.isEmpty)) {
      return customRequiredMessage ?? 'Longitude is required';
    }
    if (value != null && !_validationLogic.isValidLongitude(value)) {
      return 'Invalid longitude value';
    }
    return null;
  }
}
