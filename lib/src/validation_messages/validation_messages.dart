import 'package:boolean_validation/src/validation_messages/message_replacements_keys.dart';

import 'package:boolean_validation/src/validation_messages/messages_provider.dart';

/// A centralized class for managing validation error messages
/// with flexible localization support.
///
/// This class provides default English messages and allows to override them
/// using any localization system
/// through the [ValidationMessageProvider] interface.
/// It supports both static configuration and dynamic localization.
///
/// Usage Examples:
///
/// **Basic usage (English only):**
/// ```dart
/// final message = ValidationMessages().mobileNumberRequired;
/// ```
///
/// **With ARB localization:**
/// ```dart
/// class AppLocalizationProvider implements ValidationMessageProvider {
///   final AppLocalizations l10n;
///   AppLocalizationProvider(this.l10n);
///
///   @override
///   String? get mobileNumberRequired => l10n.mobileNumberRequired;
///   // ... add other getters
/// }
///
/// // Set provider
/// ValidationMessages.setProvider(AppLocalizationProvider(l10n));
/// ```
///
class ValidationMessages {
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

  /// Current localization provider
  static ValidationMessageProvider? _provider;

  /// Sets a custom localization provider.
  ///
  /// Example:
  /// ```dart
  /// ValidationMessages.provider = MyCustomProvider();
  /// ```
  static ValidationMessageProvider? provider;

  // Default English messages (fallbacks)
  static const String _defaultMobileNumberRequired =
      'Mobile number is required';
  static const String _defaultGenericRequiredMessage = 'Field is required';
  static const String _defaultInvalidMobileNumber =
      'Please enter a valid mobile number';
  static const String _defaultCreditCardRequired =
      'Credit card number is required';
  static const String _defaultInvalidCreditCard =
      'Please enter a valid credit card number';
  static const String _defaultExpirationDateRequired =
      'Expiration date is required';
  static const String _defaultSecurityCodeRequired =
      'Security code is required';
  static const String _defaultCardholderNameRequired =
      'Cardholder name is required';
  static const String _defaultInvalidCardholderName =
      'Please enter a valid cardholder name';
  static const String _defaultEmailRequired = 'Email is required';
  static const String _defaultInvalidEmail =
      'Please enter a valid email address';
  static const String _defaultEmailFormatValidation =
      'Email format is invalid.';
  static const String _defaultEmailDomainValidation =
      'Email must be a <${MessageReplacementKeys.domain}> address.';
  static const String _defaultUsernameRequired = 'Username is required';
  static const String _defaultUsernameInvalid =
      'Username must be 4-20 characters long and can '
      'include letters, numbers, and underscores';
  static const String _defaultFullNameRequired = 'Full name is required.';
  static const String _defaultFullNameInvalid = 'Please enter your full name';
  static const String _defaultNameMustBeAlphabetic =
      'Name must contain only alphabets.';
  static const String _defaultNameRequired = 'Name is Required';
  static const String _defaultPasswordMinLength =
      'Password must be at least <${MessageReplacementKeys.minLength}> '
      'characters long.';
  static const String _defaultPasswordUppercase =
      'Password must contain at least one uppercase letter.';
  static const String _defaultPasswordLowercase =
      'Password must contain at least one lowercase letter.';
  static const String _defaultPasswordDigit =
      'Password must contain at least one digit.';
  static const String _defaultPasswordSpecialChar =
      r'Password must contain at least one special character (!@#$&*~).';
  static const String _defaultLatitudeRequired = 'Latitude is required';
  static const String _defaultInvalidLatitude = 'invalid latitude value';
  static const String _defaultLongitudeRequired = 'Longitude is required';
  static const String _defaultInvalidLongitude = 'invalid longitude value';
  static const String _defaultNumberRequired = 'Digits Number is required';
  static const String _defaultDoubleRequired =
      'Decimal (0.0) Number is required';
  static const String _defaultPositiveNumRequired =
      'Positive Number is required';
  static const String _defaultInvalidNumber = 'Invalid digits';
  static const String _defaultInvalidDoubleNumber = 'Invalid decimal number';
  static const String _defaultInvalidPositiveNumber = 'Invalid positive number';
  static const String _defaultUrlRequired = 'URL is required';
  static const String _defaultInvalidUrl = 'Please enter a valid URL format';
  static const String _defaultDateRequired = 'Date is Required';
  static const String _defaultInvalidDate = 'Please enter a valid date';
  static const String _defaultAlphaRequired = 'Alphabets are Required';
  static const String _defaultAlphaInvalid =
      'This field must contain only alphabets.';
  static const String _defaultAlphaNumericRequired = 'This Field is Required';
  static const String _defaultAlphaNumericInvalid =
      'This field must contain only Alphabets and Numbers characters.';

  // Validation message getters (with provider fallback)
  String get mobileNumberRequired =>
      _provider?.mobileNumberRequired ?? _defaultMobileNumberRequired;

  String get genericRequiredMessage =>
      _provider?.genericRequiredMessage ?? _defaultGenericRequiredMessage;

  String get invalidMobileNumber =>
      _provider?.invalidMobileNumber ?? _defaultInvalidMobileNumber;

  String get creditCardRequired =>
      _provider?.creditCardRequired ?? _defaultCreditCardRequired;

  String get invalidCreditCard =>
      _provider?.invalidCreditCard ?? _defaultInvalidCreditCard;

  String get expirationDateRequired =>
      _provider?.expirationDateRequired ?? _defaultExpirationDateRequired;

  String get securityCodeRequired =>
      _provider?.securityCodeRequired ?? _defaultSecurityCodeRequired;

  String get cardholderNameRequired =>
      _provider?.cardholderNameRequired ?? _defaultCardholderNameRequired;

  String get invalidCardholderName =>
      _provider?.invalidCardholderName ?? _defaultInvalidCardholderName;

  String get emailRequired => _provider?.emailRequired ?? _defaultEmailRequired;

  String get invalidEmail => _provider?.invalidEmail ?? _defaultInvalidEmail;

  String get emailFormatValidation =>
      _provider?.emailFormatValidation ?? _defaultEmailFormatValidation;

  String get emailDomainValidation =>
      _provider?.emailDomainValidation ?? _defaultEmailDomainValidation;

  String get usernameRequired =>
      _provider?.usernameRequired ?? _defaultUsernameRequired;

  String get usernameInvalid =>
      _provider?.usernameInvalid ?? _defaultUsernameInvalid;

  String get fullNameRequired =>
      _provider?.fullNameRequired ?? _defaultFullNameRequired;

  String get fullNameInvalid =>
      _provider?.fullNameInvalid ?? _defaultFullNameInvalid;

  String get nameMustBeAlphabetic =>
      _provider?.nameMustBeAlphabetic ?? _defaultNameMustBeAlphabetic;

  String get nameRequired => _provider?.nameRequired ?? _defaultNameRequired;

  String get passwordMinLength =>
      _provider?.passwordMinLength ?? _defaultPasswordMinLength;

  String get passwordUppercase =>
      _provider?.passwordUppercase ?? _defaultPasswordUppercase;

  String get passwordLowercase =>
      _provider?.passwordLowercase ?? _defaultPasswordLowercase;

  String get passwordDigit => _provider?.passwordDigit ?? _defaultPasswordDigit;

  String get passwordSpecialChar =>
      _provider?.passwordSpecialChar ?? _defaultPasswordSpecialChar;

  String get latitudeRequired =>
      _provider?.latitudeRequired ?? _defaultLatitudeRequired;

  String get invalidLatitude =>
      _provider?.invalidLatitude ?? _defaultInvalidLatitude;

  String get longitudeRequired =>
      _provider?.longitudeRequired ?? _defaultLongitudeRequired;

  String get invalidLongitude =>
      _provider?.invalidLongitude ?? _defaultInvalidLongitude;

  String get numberRequired =>
      _provider?.numberRequired ?? _defaultNumberRequired;

  String get doubleRequired =>
      _provider?.dateRequired ?? _defaultDoubleRequired;

  String get positiveNumRequired =>
      _provider?.positiveNumRequired ?? _defaultPositiveNumRequired;

  String get invalidNumber => _provider?.invalidNumber ?? _defaultInvalidNumber;

  String get invalidDouble =>
      _provider?.invalidDoubleNumber ?? _defaultInvalidDoubleNumber;

  String get invalidPositiveNum =>
      _provider?.invalidPositiveNumber ?? _defaultInvalidPositiveNumber;

  String get urlRequired => _provider?.urlRequired ?? _defaultUrlRequired;

  String get invalidUrl => _provider?.invalidUrl ?? _defaultInvalidUrl;

  String get dateRequired => _provider?.dateRequired ?? _defaultDateRequired;

  String get invalidDate => _provider?.invalidDate ?? _defaultInvalidDate;

  String get alphaRequired => _provider?.alphaRequired ?? _defaultAlphaRequired;

  String get alphaInvalid => _provider?.alphaInvalid ?? _defaultAlphaInvalid;

  String get alphaNumericRequired =>
      _provider?.alphaNumericRequired ?? _defaultAlphaNumericRequired;

  String get alphaNumericInvalid =>
      _provider?.alphaNumericInvalid ?? _defaultAlphaNumericInvalid;

  /// Global flag to determine whether
  /// to use the generic required message for all inputs.
  bool useGenericRequiredMessage = true;

  // Singleton instance of the class.
  static final ValidationMessages _instance = ValidationMessages._internal();

  /// Overrides specific validation messages while keeping others unchanged.
  ///
  /// This method is useful for
  /// customizing messages globally or for localization.
  /// Note: If a provider is set, it will be used instead of these overrides.
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
    String? expirationDateRequired,
    String? securityCodeRequired,
    String? cardholderNameRequired,
    String? invalidCardholderName,
    String? emailRequired,
    String? invalidEmail,
    String? emailFormatValidation,
    String? emailDomainValidation,
    String? usernameRequired,
    String? usernameInvalid,
    String? fullNameRequired,
    String? fullNameInvalid,
    String? nameMustBeAlphabetic,
    String? nameRequired,
    String? passwordMinLength,
    String? passwordUppercase,
    String? passwordLowercase,
    String? passwordDigit,
    String? passwordSpecialChar,
    String? latitudeRequired,
    String? invalidLatitude,
    String? longitudeRequired,
    String? invalidLongitude,
    String? numberRequired,
    String? doubleRequired,
    String? positiveNumRequired,
    String? invalidNumber,
    String? invalidDoubleNumber,
    String? invalidPositiveNumber,
    String? urlRequired,
    String? invalidUrl,
    String? dateRequired,
    String? invalidDate,
    String? alphaRequired,
    String? alphaInvalid,
    String? alphaNumericRequired,
    String? alphaNumericInvalid,
    String? genericRequiredMessage,
  }) {
    // Create a custom provider with override values
    final overrideProvider = _OverrideProvider(
      mobileNumberRequired: mobileNumberRequired,
      invalidMobileNumber: invalidMobileNumber,
      creditCardRequired: creditCardRequired,
      invalidCreditCard: invalidCreditCard,
      expirationDateRequired: expirationDateRequired,
      securityCodeRequired: securityCodeRequired,
      cardholderNameRequired: cardholderNameRequired,
      invalidCardholderName: invalidCardholderName,
      emailRequired: emailRequired,
      invalidEmail: invalidEmail,
      emailFormatValidation: emailFormatValidation,
      emailDomainValidation: emailDomainValidation,
      usernameRequired: usernameRequired,
      usernameInvalid: usernameInvalid,
      fullNameRequired: fullNameRequired,
      fullNameInvalid: fullNameInvalid,
      nameMustBeAlphabetic: nameMustBeAlphabetic,
      nameRequired: nameRequired,
      passwordMinLength: passwordMinLength,
      passwordUppercase: passwordUppercase,
      passwordLowercase: passwordLowercase,
      passwordDigit: passwordDigit,
      passwordSpecialChar: passwordSpecialChar,
      latitudeRequired: latitudeRequired,
      invalidLatitude: invalidLatitude,
      longitudeRequired: longitudeRequired,
      invalidLongitude: invalidLongitude,
      numberRequired: numberRequired,
      doubleRequired: doubleRequired,
      positiveNumRequired: positiveNumRequired,
      invalidNumber: invalidNumber,
      invalidDoubleNumber: invalidDoubleNumber,
      invalidPositiveNumber: invalidPositiveNumber,
      urlRequired: urlRequired,
      invalidUrl: invalidUrl,
      dateRequired: dateRequired,
      invalidDate: invalidDate,
      alphaRequired: alphaRequired,
      alphaInvalid: alphaInvalid,
      alphaNumericRequired: alphaNumericRequired,
      alphaNumericInvalid: alphaNumericInvalid,
      genericRequiredMessage: genericRequiredMessage,
    );

    _provider = overrideProvider;
    this.useGenericRequiredMessage =
        useGenericRequiredMessage ?? this.useGenericRequiredMessage;
  }

  /// Returns the appropriate required message
  /// based on the global configuration and custom message.
  ///
  /// Parameters:
  /// - [customMessage]: A custom message provided by the developer.
  /// - [defaultSpecificMessage]: The default message
  /// for the specific input (e.g., [mobileNumberRequired]).
  ///
  /// Returns:
  /// - The custom message if provided.
  /// - The generic [genericRequiredMessage] message if
  /// [useGenericRequiredMessage] is `true`.
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

    var formattedMessage = message;

    replacements.forEach((key, value) {
      final replacementValue = _convertToString(value);
      formattedMessage =
          formattedMessage.replaceAll('<$key>', replacementValue);
    });

    return formattedMessage;
  }

  /// Converts different types of values to strings safely.
  ///
  /// - Enums: Converts `Enum.value` to a readable string
  /// (e.g., `EmailDomain.google → "google"`).
  /// - Other Objects: Uses `toString()`, handling null values as empty strings.
  /// - Numbers, Strings, Booleans: Converted as expected.
  String _convertToString(dynamic value) {
    if (value == null) return '';
    if (value is Enum) return value.name;
    return value.toString();
  }
}

/// Internal provider for copyWith overrides
class _OverrideProvider implements ValidationMessageProvider {
  const _OverrideProvider({
    this.mobileNumberRequired,
    this.invalidMobileNumber,
    this.creditCardRequired,
    this.invalidCreditCard,
    this.expirationDateRequired,
    this.securityCodeRequired,
    this.cardholderNameRequired,
    this.invalidCardholderName,
    this.emailRequired,
    this.invalidEmail,
    this.emailFormatValidation,
    this.emailDomainValidation,
    this.usernameRequired,
    this.usernameInvalid,
    this.fullNameRequired,
    this.fullNameInvalid,
    this.nameMustBeAlphabetic,
    this.nameRequired,
    this.passwordMinLength,
    this.passwordUppercase,
    this.passwordLowercase,
    this.passwordDigit,
    this.passwordSpecialChar,
    this.latitudeRequired,
    this.invalidLatitude,
    this.longitudeRequired,
    this.invalidLongitude,
    this.numberRequired,
    this.doubleRequired,
    this.positiveNumRequired,
    this.invalidNumber,
    this.invalidDoubleNumber,
    this.invalidPositiveNumber,
    this.urlRequired,
    this.invalidUrl,
    this.dateRequired,
    this.invalidDate,
    this.alphaRequired,
    this.alphaInvalid,
    this.alphaNumericRequired,
    this.alphaNumericInvalid,
    this.genericRequiredMessage,
  });

  @override
  final String? mobileNumberRequired;
  @override
  final String? invalidMobileNumber;
  @override
  final String? genericRequiredMessage;
  @override
  final String? creditCardRequired;
  @override
  final String? invalidCreditCard;
  @override
  final String? expirationDateRequired;
  @override
  final String? securityCodeRequired;
  @override
  final String? cardholderNameRequired;
  @override
  final String? invalidCardholderName;
  @override
  final String? emailRequired;
  @override
  final String? invalidEmail;
  @override
  final String? emailFormatValidation;
  @override
  final String? emailDomainValidation;
  @override
  final String? usernameRequired;
  @override
  final String? usernameInvalid;
  @override
  final String? fullNameRequired;
  @override
  final String? fullNameInvalid;
  @override
  final String? nameMustBeAlphabetic;
  @override
  final String? nameRequired;
  @override
  final String? passwordMinLength;
  @override
  final String? passwordUppercase;
  @override
  final String? passwordLowercase;
  @override
  final String? passwordDigit;
  @override
  final String? passwordSpecialChar;
  @override
  final String? latitudeRequired;
  @override
  final String? invalidLatitude;
  @override
  final String? longitudeRequired;
  @override
  final String? invalidLongitude;
  @override
  final String? numberRequired;
  @override
  final String? doubleRequired;
  @override
  final String? positiveNumRequired;
  @override
  final String? invalidNumber;
  @override
  final String? invalidDoubleNumber;
  @override
  final String? invalidPositiveNumber;
  @override
  final String? urlRequired;
  @override
  final String? invalidUrl;
  @override
  final String? dateRequired;
  @override
  final String? invalidDate;
  @override
  final String? alphaRequired;
  @override
  final String? alphaInvalid;
  @override
  final String? alphaNumericRequired;

  @override
  final String? alphaNumericInvalid;
}
