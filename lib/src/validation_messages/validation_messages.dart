import 'package:boolean_validation/src/validation_messages/message_replacements_keys.dart';

/// A centralized class for managing validation error messages.
///
/// This class provides default English messages for common validation scenarios.
/// Developers can override these messages globally or for specific use cases.
/// It follows a singleton pattern to ensure consistent access across the app
class ValidationMessages {
  String mobileNumberRequired = 'Mobile number is required';
  String genericRequiredMessage = 'Field is required';
  String invalidMobileNumber = 'Please enter a valid mobile number';
  String creditCardRequired = 'Credit card number is required';
  String invalidCreditCard = 'Please enter a valid credit card number';
  String expirationDateRequired = 'Expiration date is required';
  String securityCodeRequired = 'Security code is required';
  String cardholderNameRequired = 'Cardholder name is required';
  String invalidCardholderName = 'Please enter a valid cardholder name';
  String emailRequired = 'Email is required';
  String invalidEmail = 'Please enter a valid email address';
  String emailFormatValidation = 'Email format is invalid.';
  String emailDomainValidation =
      'Email must be a {$MessageReplacementKeys.domain} address.';

  String usernameRequired = 'Username is required';
  String usernameInvalid =
      'Username must be 4-20 characters long and can include letters, numbers, and underscores';

  String fullNameRequired = 'Full name is required.';
  String fullNameInvalid = 'Please enter your full name';
  String nameMustBeAlphabetic = 'Name must contain only alphabets.';
  String nameRequired = 'Name is Required';

  String passwordMinLength =
      'Password must be at least {$MessageReplacementKeys.minLength} characters long.';
  String passwordUppercase =
      'Password must contain at least one uppercase letter.';
  String passwordLowercase =
      'Password must contain at least one lowercase letter.';
  String passwordDigit = 'Password must contain at least one digit.';
  String passwordSpecialChar =
      'Password must contain at least one special character (!@#\$&*~).';

  String latitudeRequired = 'Latitude is required';
  String invalidLatitude = 'invalid latitude value';
  String longitudeRequired = 'Longitude is required';
  String invalidLongitude = 'invalid longitude value';

  String numberRequired = 'Digits Number is required';
  String invalidNumber = 'Invalid digits';

  String urlRequired = 'URL is required';
  String invalidUrl = 'Please enter a valid URL format';

  String dateRequired = 'Date is Required';
  String invalidDate = 'Please enter a valid date';

  String alphaRequired = 'Alphabets are Required';
  String alphaInvalid = 'This field must contain only alphabets.';

  String alphaNumericRequired =  'This Field is Required';
  String alphaNumericInvalid = 'This field must contain only Alphabets and Numbers characters.';

  /// Global flag to determine whether to use the generic required message for all inputs.
  bool useGenericRequiredMessage = true;

  // Singleton instance of the class.
  static final ValidationMessages _instance = ValidationMessages._internal();

  /// Factory constructor to provide access to the singleton instance.
  ///
  /// Usage:
  /// ```dart
  /// final messages = ValidationMessages();
  /// ```
  factory ValidationMessages() {
    return _instance;
  }

  // Private constructor to enforce singleton pattern.
  ValidationMessages._internal();

  /// Overrides specific validation messages while keeping others unchanged.
  ///
  /// This method is useful for customizing messages globally or for localization.
  ///
  /// Example:
  /// ```dart
  /// ValidationMessages().copyWith(
  ///   mobileNumberRequired: 'Phone number is mandatory',
  ///   invalidCreditCard: 'Invalid card number',
  /// );
  /// ```
  void copyWith({
    String? mobileNumberRequired,
    String? invalidMobileNumber,
    String? creditCardRequired,
    String? invalidCreditCard,
    bool? useGenericRequiredMessage,
  }) {
    this.mobileNumberRequired =
        mobileNumberRequired ?? this.mobileNumberRequired;
    this.invalidMobileNumber = invalidMobileNumber ?? this.invalidMobileNumber;
    this.creditCardRequired = creditCardRequired ?? this.creditCardRequired;
    this.invalidCreditCard = invalidCreditCard ?? this.invalidCreditCard;
    this.useGenericRequiredMessage =
        useGenericRequiredMessage ?? this.useGenericRequiredMessage;
  }

  /// Returns the appropriate required message based on the global configuration and custom message.
  ///
  /// Parameters:
  /// - [customMessage]: A custom message provided by the developer.
  /// - [defaultSpecificMessage]: The default message for the specific input (e.g., [mobileNumberRequired]). coming from `ValidationMessages()`
  ///
  /// Returns:
  /// - The custom message if provided.
  /// - The generic [genericRequiredMessage] message if [useGenericRequiredMessage] is `true`.
  /// - The default specific message if [useGenericRequiredMessage] is `false`.
  String getRequiredMessage({
    String? customMessage,
    String? defaultSpecificMessage,
  }) {
    if (customMessage != null) {
      return customMessage; // Custom message takes priority
    }
    if (useGenericRequiredMessage) {
      return genericRequiredMessage; // Use generic required message if enabled
    }
    return defaultSpecificMessage ??
        genericRequiredMessage; // Fallback to specific or generic message
  }

  /// Formats messages dynamically.
  ///
  /// - Automatically converts enums, objects, and other values to strings.
  /// - Replaces `{key}` placeholders in the message with corresponding values.
  /// - Handles null values safely by replacing them with an empty string.
  String formatMessage({
    required String message,
    required Map<String, dynamic> replacements,
  }) {
    if (replacements.isEmpty) return message;

    String formattedMessage = message;

    replacements.forEach((key, value) {
      String replacementValue = _convertToString(value);
      formattedMessage =
          formattedMessage.replaceAll('{$key}', replacementValue);
    });

    return formattedMessage;
  }

  /// Converts different types of values to strings safely.
  ///
  /// - Enums: Converts `Enum.value` to a readable string (e.g., `EmailDomain.google → "google"`).
  /// - Other Objects: Uses `toString()`, handling null values as empty strings.
  /// - Numbers, Strings, Booleans: Converted as expected.
  String _convertToString(dynamic value) {
    if (value == null) return '';
    if (value is Enum) return value.name;
    return value.toString();
  }
}
