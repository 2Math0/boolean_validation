import 'package:boolean_validation/src/core/common_libs.dart';
import 'package:boolean_validation/src/validation_groups/user_input_validators.dart';

import '../../test_common_libs.dart';

void main() {
  final UserInputValidators validators = Validators().userInput;
  final ValidationMessages messages = ValidationMessages();

  group('Name Validation', () {
    test('Valid Name', () {
      expect(
        validators.validateName('Thomas Meshail'),
        messages.nameMustBeAlphabetic,
      );
    });

    test('Empty Name - Required', () {
      expect(
        validators.validateName(''),
        messages.nameRequired,
      );
    });

    test('Invalid Name - Contains Numbers', () {
      expect(
        validators.validateName('2Math'),
        messages.nameMustBeAlphabetic,
      );
    });

    test('Invalid Name - Contains Special Characters', () {
      expect(
        validators.validateName('Thomas! Meshail'),
        messages.nameMustBeAlphabetic,
      );
    });

    // Additional test for custom required message
    test('Custom Required Message', () {
      const String nameMsg = 'Please provide your name';
      expect(
        validators.validateName('', customRequiredMessage: nameMsg),
        nameMsg,
      );
    });

    // Additional test for custom invalid message
    test('Custom Invalid Message', () {
      const String invalidMsg = 'Invalid name format';
      expect(
        validators.validateName('2Math',
            customInvalidMessage: 'Invalid name format'),
        'Invalid name format',
      );
    });
  });
}
