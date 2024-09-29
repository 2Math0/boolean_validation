import '../../test_common_libs.dart';

void main() {
  final Validators validators = Validators();

  group('Alpha Validation', () {
    test('Valid Alpha', () {
      expect(
        validators.dataType.validateAlpha('HelloWorld'),
        null,
      );
    });

    test('Empty Alpha - Required', () {
      expect(
        validators.dataType.validateAlpha(''),
        'This field is required.',
      );
    });

    test('Invalid Alpha Value', () {
      expect(
        validators.dataType.validateAlpha('Hello123'), // Invalid alpha
        'This field must contain only alphabets.',
      );
    });

    test('Null Alpha - Required', () {
      expect(
        validators.dataType.validateAlpha(''),
        'This field is required.',
      );
    });

    // Additional test for custom required message
    test('Custom Required Message', () {
      expect(
        validators.dataType
            .validateAlpha('', customRequiredMessage: 'Please provide a name'),
        'Please provide a name',
      );
    });
  });
}
