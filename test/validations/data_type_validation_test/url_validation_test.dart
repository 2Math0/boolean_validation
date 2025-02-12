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

    /// it might be YAGNI but I left it anyway
    ///
    // test('Null URL - Required', () {
    //   expect(
    //     validators.dataType.validateUrl(null),
    //     'URL is required',
    //   );
    // });

    // Additional test for custom required message
    test('Custom Required Message', () {
      String customMsg = 'Please provide a URL';
      expect(
        validators.dataType.validateUrl('', customRequiredMessage: customMsg),
        customMsg,
      );
    });

    test('Advanced give a bad formated link', () {
      expect(
        validators.dataType.validateUrl('https:/www.example.com/bad'),
        'Please enter a valid URL',
      );
    });
  });
}
