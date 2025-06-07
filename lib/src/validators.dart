import 'package:boolean_validation/src/validation_groups/data_type_validators.dart';
import 'package:boolean_validation/src/validation_groups/location_validators.dart';
import 'package:boolean_validation/src/validation_groups/user_input_validators.dart';

import 'core/common_libs.dart';

/// A class that provides high-level validation methods for common user inputs.
/// It uses the [ValidationLogic] mixin from validation logic layer.
class Validators {
  static final Validators _instance = Validators._internal();


  factory Validators() {
    return _instance;
  }

  Validators._internal();

  final UserInputValidators userInput = UserInputValidators();
  final LocationValidators location = LocationValidators();
  final DataTypeValidators dataType = DataTypeValidators();

}
