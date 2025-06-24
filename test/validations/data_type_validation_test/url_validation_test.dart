import '../../test_common_libs.dart';

void main() {
  final validators = Validators();
  final messages = ValidationMessages();
  ValidationMessages.copyWith(useGenericRequiredMessage: false);

  group('URL Validation', () {
    test('Valid URL', () {
      expect(
        validators.dataType.validateUrl('https://www.example.com'),
        null,
      );
    });

    test('Empty URL - Required', () {
      expect(
        validators.dataType.validateUrl(''),
        messages.urlRequired,
      );
    });

    test('Invalid URL Value', () {
      expect(
        validators.dataType.validateUrl('invalid-url'), // Invalid URL
        messages.invalidUrl,
      );
    });

    test('Null URL - Required', () {
      expect(
        validators.dataType.validateUrl(null),
        messages.urlRequired,
      );
    });

    // Additional test for custom required message
    test('Custom Required Message', () {
      const customMsg = 'Please provide a URL';
      expect(
        validators.dataType.validateUrl('', customRequiredMessage: customMsg),
        customMsg,
      );
    });

    test('Advanced give a bad formated link', () {
      expect(
        validators.dataType.validateUrl('https:/www.example.com/bad'),
        messages.invalidUrl,
      );
    });
  });
}
