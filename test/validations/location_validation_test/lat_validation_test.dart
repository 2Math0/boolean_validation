import 'package:boolean_validation/boolean_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final Validators validators = Validators();

  group('Latitude Validation', () {
    test('Valid Latitude', () {
      expect(
        validators.location.validateLat('37.7749'),
        null,
      );
    });

    test('Empty Latitude - Required', () {
      expect(
        validators.location.validateLat(''),
        'Latitude is required',
      );
    });

    test('Invalid Latitude Value', () {
      expect(
        validators.location.validateLat('200.0'), // Invalid latitude
        'Invalid latitude value',
      );
    });

    test('Null Latitude - Required', () {
      expect(
        validators.location.validateLat(null),
        'Latitude is required',
      );
    });

    // Additional test for custom required message
    test('Custom Required Message', () {
      expect(
        validators.location.validateLat(null,
            customRequiredMessage: 'Please provide latitude'),
        'Please provide latitude',
      );
    });
  });
}
