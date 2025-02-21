import '../../test_common_libs.dart';

void main() {
  final Validators validators = Validators();
  final ValidationMessages messages = ValidationMessages();
  messages.copyWith(useGenericRequiredMessage: false);

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
        messages.latitudeRequired,
      );
    });

    test('Invalid Latitude Value', () {
      expect(
        validators.location.validateLat('200.0'), // Invalid latitude
        messages.invalidLatitude,
      );
    });

    test('Null Latitude - Required', () {
      expect(
        validators.location.validateLat(null),
        messages.latitudeRequired,
      );
    });

    // Additional test for custom required message
    test('Custom Required Message', () {
      var customMsg = 'Please provide latitude';
      expect(
        validators.location.validateLat(null, customRequiredMessage: customMsg),
        customMsg,
      );
    });
  });
}
