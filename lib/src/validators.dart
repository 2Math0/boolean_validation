import 'package:boolean_validation/src/is_valid.dart';
import 'package:boolean_validation/src/validation_groups/data_type_validators.dart';
import 'package:boolean_validation/src/validation_groups/location_validators.dart';
import 'package:boolean_validation/src/validation_groups/user_input_validators.dart';

/// A class that provides high-level validation methods for common user inputs.
/// It uses the [ValidationLogic] mixin for actual validation logic.
class Validators {
  final ValidationLogic validationLogic = ValidationLogic();
  static final Validators _instance = Validators._internal();

  factory Validators() {
    return _instance;
  }

  Validators._internal();

  final UserInputValidators userInput = UserInputValidators();
  final LocationValidators location = LocationValidators();
  final DataTypeValidators dataType = DataTypeValidators();

  /// Validates a mobile number.
  /// Returns an error message if invalid; otherwise, null.
  String? validateMobileNumber(
    String? value, {
    bool isRequired = true,
    String? customRequiredMessage,
    String? customInvalidMessage,
    String? prefix,
  }) {
    if (isRequired && (value == null || value.isEmpty)) {
      return customRequiredMessage ?? 'Mobile number is required';
    }
    if (value != null &&
        !validationLogic.isCorrectMobileNumber(value, prefix)) {
      return customInvalidMessage ?? 'Please enter a valid mobile number';
    }
    return null;
  }

  /// Validates a 16-digit credit card number using the Luhn algorithm.
  /// Returns an error message if invalid; otherwise, null.
  String? validateCreditCard(
    String value, {
    bool isRequired = true,
    String? customRequiredMessage,
    String? customInvalidMessage,
  }) {
    if (isRequired && value.isEmpty) {
      return customRequiredMessage ?? 'Credit card number is required';
    }
    if (!validationLogic.isValidCreditCard(value)) {
      return customInvalidMessage ?? 'Please enter a valid credit card number';
    }
    return null;
  }
}
