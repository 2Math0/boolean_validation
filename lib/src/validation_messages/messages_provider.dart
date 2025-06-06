/// Interface for providing localized validation messages.
///
/// You can implement this interface to provide messages from any source:
abstract class ValidationMessageProvider {
  String? get mobileNumberRequired;

  String? get invalidMobileNumber;

  String? get genericRequiredMessage;

  String? get creditCardRequired;

  String? get invalidCreditCard;

  String? get expirationDateRequired;

  String? get securityCodeRequired;

  String? get cardholderNameRequired;

  String? get invalidCardholderName;

  String? get emailRequired;

  String? get invalidEmail;

  String? get emailFormatValidation;

  String? get emailDomainValidation;

  String? get usernameRequired;

  String? get usernameInvalid;

  String? get fullNameRequired;

  String? get fullNameInvalid;

  String? get nameMustBeAlphabetic;

  String? get nameRequired;

  String? get passwordMinLength;

  String? get passwordUppercase;

  String? get passwordLowercase;

  String? get passwordDigit;

  String? get passwordSpecialChar;

  String? get latitudeRequired;

  String? get invalidLatitude;

  String? get longitudeRequired;

  String? get invalidLongitude;

  String? get numberRequired;

  String? get doubleRequired;

  String? get positiveNumRequired;

  String? get invalidNumber;

  String? get invalidDoubleNumber;

  String? get invalidPositiveNumber;

  String? get urlRequired;

  String? get invalidUrl;

  String? get dateRequired;

  String? get invalidDate;

  String? get alphaRequired;

  String? get alphaInvalid;

  String? get alphaNumericRequired;

  String? get alphaNumericInvalid;
}
