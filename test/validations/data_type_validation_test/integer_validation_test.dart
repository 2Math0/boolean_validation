import 'package:boolean_validation/src/validation_groups/data_type_validators.dart';

import '../../test_common_libs.dart';

void main() {
  final DataTypeValidators validators = Validators().dataType;
  final ValidationMessages messages = ValidationMessages();
  messages.copyWith(useGenericRequiredMessage: false);

  group('Integer Validation', () {
    test('Valid Integer', () {
      expect(
        validators.validateInteger('42'),
        null,
      );
    });

    test('Empty Integer - Required', () {
      expect(
        validators.validateInteger(''),
        messages.numberRequired,
      );
    });

    test('Invalid Integer Value', () {
      expect(
        validators.validateInteger('abc'), // Invalid integer
        messages.invalidNumber,
      );
    });

    test('Null Integer - Required', () {
      expect(
        validators.validateInteger(null),
        messages.numberRequired,
      );
    });

    // Additional test for custom required message
    test('Custom Required Message', () {
      var numberMsg = 'Please provide a number';
      expect(
        validators.validateInteger(null, customRequiredMessage: numberMsg),
        numberMsg,
      );
    });
  });
}
