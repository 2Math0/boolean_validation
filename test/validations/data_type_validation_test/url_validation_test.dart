import '../../test_common_libs.dart';

void main() {
  final Validators validators = Validators();

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
        'URL is required',
      );
    });

    test('Invalid URL Value', () {
      expect(
        validators.dataType.validateUrl('invalid-url'), // Invalid URL
        'Please enter a valid URL',
      );
    });

    test('Null URL - Required', () {
      expect(
        validators.dataType.validateUrl(''),
        'URL is required',
      );
    });

    // Additional test for custom required message
    test('Custom Required Message', () {
      expect(
        validators.dataType
            .validateUrl('', customRequiredMessage: 'Please provide a URL'),
        'Please provide a URL',
      );
    });
  });
}
