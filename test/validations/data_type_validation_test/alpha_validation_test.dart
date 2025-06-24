import '../../test_common_libs.dart';

void main() {
  final validators = Validators().dataType;
  ValidationMessages.copyWith(useGenericRequiredMessage: false);
  final messages = ValidationMessages();

  group('Alpha Validation', () {
    test('Valid Alpha', () {
      expect(
        validators.validateAlpha('ThomasMeshail'),
        null,
      );
    });

    test('Empty Alpha - Required', () {
      expect(
        validators.validateAlpha(''),
        messages.alphaRequired,
      );
    });

    test('Invalid Alpha Value', () {
      expect(
        validators.validateAlpha('2Math'), // Invalid alpha
        messages.alphaInvalid,
      );
    });

    test('Null Alpha - Required', () {
      expect(
        validators.validateAlpha(null),
        messages.alphaRequired,
      );
    });

    // Additional test for custom required message
    test('Custom Required Message', () {
      const nameMsg = 'Please provide a name';
      expect(
        validators.validateAlpha('', customRequiredMessage: nameMsg),
        nameMsg,
      );
    });
  });
}
