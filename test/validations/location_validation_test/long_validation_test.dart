import 'package:boolean_validation/boolean_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final Validators validators = Validators();
  group('Longitude Validation', () {
    test('Valid Longitude', () {
      expect(
        validators.location.validateLong('122.4194'),
        null,
      );
    });

    test('Empty Longitude - Required', () {
      expect(
        validators.location.validateLong(''),
        'Longitude is required',
      );
    });

    test('Invalid Longitude Value', () {
      expect(
        validators.location.validateLong('400.0'), // Invalid longitude
        'Invalid longitude value',
      );
    });

    test('Null Longitude - Required', () {
      expect(
        validators.location.validateLong(null),
        'Longitude is required',
      );
    });

    // Additional test for custom required message
    test('Custom Required Message', () {
      expect(
        validators.location.validateLong(null,
            customRequiredMessage: 'Please provide longitude'),
        'Please provide longitude',
      );
    });
  });
}
