import 'package:boolean_validation/src/is_valid.dart';
import 'package:boolean_validation/src/validation_groups/data_type_validators.dart';
import 'package:boolean_validation/src/validation_groups/location_validators.dart';
import 'package:boolean_validation/src/validation_groups/user_input_validators.dart';
import 'package:boolean_validation/src/validation_messages/validation_messages.dart';

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
    String? prefix,
    String? customRequiredMessage,
    String? customInvalidMessage,
  }) {
    if (isRequired && (value == null || value.isEmpty)) {
      return ValidationMessages().getRequiredMessage(
        customMessage: customRequiredMessage,
        defaultSpecificMessage: ValidationMessages().mobileNumberRequired,
      );
    }
    if (value != null &&
        !validationLogic.isCorrectMobileNumber(value, prefix)) {
      return customInvalidMessage ?? ValidationMessages().invalidMobileNumber;
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
    if (isRequired && (value == null || value.isEmpty)) {
      return ValidationMessages().getRequiredMessage(
        customMessage: customRequiredMessage,
        defaultSpecificMessage: ValidationMessages().creditCardRequired,
      );
    }
    if (!validationLogic.isValidCreditCard(value!)) {
      return customInvalidMessage ?? ValidationMessages().invalidCreditCard;
    }
    return null;
  }
}
