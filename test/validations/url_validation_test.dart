import 'package:flutter_test/flutter_test.dart';
import 'package:boolean_validation/boolean_validation.dart';

void main() {
  final Validators validators = Validators();

  group('URL Validation', () {
    test('Valid URL', () {
      expect(
        validators.validateUrl('http://example.com', 'URL is required', 'Invalid URL'),
        null,
      );
    });

    test('Empty URL', () {
      expect(
        validators.validateUrl('', 'URL is required', 'Invalid URL'),
        'URL is required',
      );
    });

    test('Invalid URL Format', () {
      expect(
        validators.validateUrl('invalidurl', 'URL is required', 'Invalid URL'),
        'Invalid URL',
      );
    });

    // Add more tests specific to URL validation if needed
  });
}
