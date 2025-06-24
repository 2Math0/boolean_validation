import 'package:boolean_validation/src/core/common_libs.dart';

abstract class ValidationCommon {
  final ValidationLogic validationLogic = ValidationLogic();
  final ValidationMessages messages = ValidationMessages();

  /// Handles required field validation.
  String? validateRequired({
    required String? value,
    required bool isRequired,
    required String defaultMessage,
    String? customMessage,
  }) {
    if (isRequired && !validationLogic.isRequiredField(value)) {
      return ValidationMessages().getRequiredMessage(
        customMessage: customMessage,
        defaultSpecificMessage: defaultMessage,
      );
    }
    return null;
  }
}
