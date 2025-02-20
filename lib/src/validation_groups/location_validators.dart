import 'package:boolean_validation/src/is_valid.dart';
import 'package:boolean_validation/src/validation_groups/validation_common.dart';

class LocationValidators extends ValidationCommon {

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
    if (value != null && !validationLogic.isValidLatitude(value)) {
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
    if (value != null && !validationLogic.isValidLongitude(value)) {
      return 'Invalid longitude value';
    }
    return null;
  }
}
