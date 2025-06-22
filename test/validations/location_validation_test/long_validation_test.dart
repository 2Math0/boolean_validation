import '../../test_common_libs.dart';

void main() {
  final validators = Validators();
  final messages = ValidationMessages();
  messages.copyWith(useGenericRequiredMessage: false);
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
        messages.longitudeRequired,
      );
    });

    test('Invalid Longitude Value', () {
      expect(
        validators.location.validateLong('400.0'), // Invalid longitude
        messages.invalidLongitude,
      );
    });

    test('Null Longitude - Required', () {
      expect(
        validators.location.validateLong(null),
        messages.longitudeRequired,
      );
    });

    // Additional test for custom required message
    test('Custom Required Message', () {
      const customMsg = 'Please provide longitude';
      expect(
        validators.location
            .validateLong(null, customRequiredMessage: customMsg),
        customMsg,
      );
    });
  });
}
