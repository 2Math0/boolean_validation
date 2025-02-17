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
  /// - [defaultSpecificMessage]: The default message for the specific input (e.g., [mobileNumberRequired]).
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
}
