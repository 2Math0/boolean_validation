import 'package:boolean_validation/boolean_validation.dart';
import 'package:example/gen_l10n/app_localizations.dart';

class ARBValidationProvider implements ValidationMessageProvider {
  final AppLocalizations _localizations;

  ARBValidationProvider(this._localizations);

  @override
  bool get useGenericRequiredMessage => true;

  @override
  String? get mobileNumberRequired => _localizations.mobileNumberRequired;

  @override
  String? get invalidMobileNumber => _localizations.invalidMobileNumber;

  @override
  String? get genericRequiredMessage => _localizations.genericRequiredField;

  @override
  String? get creditCardRequired => _localizations.creditCardRequired;

  @override
  String? get invalidCreditCard => _localizations.invalidCreditCard;

  @override
  String? get expirationDateRequired => _localizations.expirationDateRequired;

  @override
  String? get securityCodeRequired => _localizations.securityCodeRequired;

  @override
  String? get cardholderNameRequired => _localizations.cardholderNameRequired;

  @override
  String? get invalidCardholderName => _localizations.invalidCardholderName;

  @override
  String? get emailRequired => _localizations.emailRequired;

  @override
  String? get invalidEmail => _localizations.invalidEmail;

  @override
  String? get emailFormatValidation => _localizations.emailFormatValidation;

  @override
  String? get emailDomainValidation =>
      _localizations.emailDomainValidation(EmailDomain.outlook.domainName);

  @override
  String? get usernameRequired => _localizations.usernameRequired;

  @override
  String? get usernameInvalid => _localizations.usernameInvalid;

  @override
  String? get fullNameRequired => _localizations.fullNameRequired;

  @override
  String? get fullNameInvalid => _localizations.fullNameInvalid;

  @override
  String? get nameMustBeAlphabetic => _localizations.nameMustBeAlphabetic;

  @override
  String? get nameRequired => _localizations.nameRequired;

  @override
  String? get passwordMinLength => _localizations.passwordMinLength(8);

  @override
  String? get passwordUppercase => _localizations.passwordUppercase;

  @override
  String? get passwordLowercase => _localizations.passwordLowercase;

  @override
  String? get passwordDigit => _localizations.passwordDigit;

  @override
  String? get passwordSpecialChar => _localizations.passwordSpecialChar;

  @override
  String? get latitudeRequired => _localizations.latitudeRequired;

  @override
  String? get invalidLatitude => _localizations.invalidLatitude;

  @override
  String? get longitudeRequired => _localizations.longitudeRequired;

  @override
  String? get invalidLongitude => _localizations.invalidLongitude;

  @override
  String? get numberRequired => _localizations.numberRequired;

  @override
  String? get invalidNumber => _localizations.invalidNumber;

  @override
  String? get urlRequired => _localizations.urlRequired;

  @override
  String? get invalidUrl => _localizations.invalidUrl;

  @override
  String? get dateRequired => _localizations.dateRequired;

  @override
  String? get invalidDate => _localizations.invalidDate;

  @override
  String? get alphaRequired => _localizations.alphaRequired;

  @override
  String? get alphaInvalid => _localizations.alphaInvalid;

  @override
  String? get alphaNumericRequired => _localizations.alphaNumericRequired;

  @override
  String? get alphaNumericInvalid => _localizations.alphaNumericInvalid;

  @override
  String? get doubleRequired => 'Hard Code Overwrite';

  @override
  String? get positiveNumRequired => 'Hello change me';

  @override
  String? get invalidDoubleNumber => 'Invalid Hard Code Overwrite';

  @override
  String? get invalidPositiveNumber => 'Invalid Hello change me';
}
