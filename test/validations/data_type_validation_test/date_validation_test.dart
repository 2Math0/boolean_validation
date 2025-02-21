import '../../test_common_libs.dart';

void main() {
  final Validators validators = Validators();
  final ValidationMessages messages = ValidationMessages();
  messages.copyWith(useGenericRequiredMessage: false);

  group('Date Validation', () {
    test('Valid Date', () {
      expect(
        validators.dataType.validateDate('2024-09-29'),
        null,
      );
    });

    test('Empty Date - Required', () {
      expect(
        validators.dataType.validateDate(''),
        messages.dateRequired,
      );
    });

    test('Invalid Date Format', () {
      expect(
        validators.dataType.validateDate('29-09-2024'), // Invalid date format
        messages.invalidDate,
      );
    });

    test('Null Date - Required', () {
      expect(
        validators.dataType.validateDate(null),
        messages.dateRequired,
      );
    });

    // Additional test for custom required message
    test('Custom Required Message', () {
      var customMsg = 'Please provide a date';
      expect(
        validators.dataType.validateDate('', customRequiredMessage: customMsg),
        customMsg,
      );
    });
  });
}
