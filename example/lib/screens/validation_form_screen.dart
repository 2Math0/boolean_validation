import 'package:flutter/material.dart';
import 'package:boolean_validation/boolean_validation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../widgets/animated_form_field.dart';
import '../widgets/animated_dropdown.dart';
import '../main.dart';

class ValidationFormScreen extends StatefulWidget {
  const ValidationFormScreen({Key? key}) : super(key: key);

  @override
  State<ValidationFormScreen> createState() => _ValidationFormScreenState();
}

class _ValidationFormScreenState extends State<ValidationFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _validators = Validators();
  String _selectedLanguage = 'en';
  final EmailDomain _selectedEmailDomain = EmailDomain.gmail;
  String _selectedCountryCode = '+1'; // Default to US

  // Create a map of pattern to keys for grouping
  late final Map<String, List<String>> _groupedPatterns = _groupPatterns();

  // Better grouping of patterns that considers both country codes and names
  Map<String, List<String>> _groupPatterns() {
    final Map<String, List<String>> grouped = {};

    MobileRegex.mobileNumberPatterns.forEach((key, pattern) {
      final existingGroup = grouped.entries.firstWhere(
        (entry) => entry.value
            .any((code) => MobileRegex.mobileNumberPatterns[code] == pattern),
        orElse: () => MapEntry(pattern, []),
      );

      if (existingGroup.value.isEmpty) {
        grouped[pattern] = [key];
      } else {
        grouped[existingGroup.key]!.add(key);
      }
    });

    return grouped;
  }

  // Get display text for selected code
  String _getDisplayText(String code) {
    try {
      final pattern = MobileRegex.mobileNumberPatterns[code];
      if (pattern == null) return code;

      final group = _groupedPatterns.entries
          .firstWhere((entry) => entry.value.contains(code));

      // Sort codes to show country codes first, then country names
      final otherCodes = group.value.where((c) => c != code).toList()
        ..sort((a, b) {
          final aIsNumber = int.tryParse(a.replaceAll('+', '')) != null;
          final bIsNumber = int.tryParse(b.replaceAll('+', '')) != null;
          if (aIsNumber && !bIsNumber) return -1;
          if (!aIsNumber && bIsNumber) return 1;
          return a.compareTo(b);
        });

      return otherCodes.isEmpty ? code : '$code (${otherCodes.join(", ")})';
    } catch (e) {
      return code;
    }
  }

  // Filter patterns considering groups
  List<String> _filterPatterns(String query) {
    if (query.isEmpty) {
      return _groupedPatterns.entries.map((entry) {
        final primaryCode = entry.value.first;
        final otherCodes = entry.value.skip(1).join(", ");
        return otherCodes.isEmpty ? primaryCode : '$primaryCode ($otherCodes)';
      }).toList();
    }

    final lowercaseQuery = query.toLowerCase();
    return MobileRegex.mobileNumberPatterns.keys
        .where((code) => code.toLowerCase().contains(lowercaseQuery))
        .map((code) => _getDisplayText(code))
        .toList();
  }

  // Extract the actual code from the display string
  String _extractCode(String displayString) {
    return displayString.split(' ').first;
  }

  final _controllers = {
    'email': TextEditingController(),
    'mobile': TextEditingController(),
    'countryCode': TextEditingController(),
    'password': TextEditingController(),
    'username': TextEditingController(),
    'fullName': TextEditingController(),
    'creditCard': TextEditingController(),
    'url': TextEditingController(),
    'date': TextEditingController(),
    'alpha': TextEditingController(),
    'alphanumeric': TextEditingController(),
    'latitude': TextEditingController(),
    'longitude': TextEditingController(),
  };

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.validationSuccess),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  void _updateValidationMessages(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    ValidationMessages().copyWith(
      // Just use the l10n messages directly
      emailRequired: l10n.emailRequired,
      invalidEmail: l10n.invalidEmail,
      mobileNumberRequired: l10n.mobileNumberRequired,
      invalidMobileNumber: l10n.invalidMobileNumber,
      passwordMinLength: l10n.passwordMinLength(8),
      passwordUppercase: l10n.passwordUppercase,
      passwordLowercase: l10n.passwordLowercase,
      passwordDigit: l10n.passwordDigit,
      passwordSpecialChar: l10n.passwordSpecialChar,
      creditCardRequired: l10n.creditCardRequired,
      invalidCreditCard: l10n.invalidCreditCard,
      useGenericRequiredMessage: true,
      expirationDateRequired: l10n.expirationDateRequired,
      securityCodeRequired: l10n.securityCodeRequired,
      cardholderNameRequired: l10n.cardholderNameRequired,
      invalidCardholderName: l10n.invalidCardholderName,
      emailFormatValidation: l10n.emailFormatValidation,
      emailDomainValidation: l10n.emailDomainValidation(EmailDomain.gmail),
      usernameRequired: l10n.usernameRequired,
      usernameInvalid: l10n.usernameInvalid,
      fullNameRequired: l10n.fullNameRequired,
      fullNameInvalid: l10n.fullNameInvalid,
      nameMustBeAlphabetic: l10n.nameMustBeAlphabetic,
      nameRequired: l10n.nameRequired,
      latitudeRequired: l10n.latitudeRequired,
      invalidLatitude: l10n.invalidLatitude,
      longitudeRequired: l10n.longitudeRequired,
      invalidLongitude: l10n.invalidLongitude,
      numberRequired: l10n.numberRequired,
      invalidNumber: l10n.invalidNumber,
      urlRequired: l10n.urlRequired,
      invalidUrl: l10n.invalidUrl,
      dateRequired: l10n.dateRequired,
      invalidDate: l10n.invalidDate,
      alphaRequired: l10n.alphaRequired,
      alphaInvalid: l10n.alphaInvalid,
      alphaNumericRequired: l10n.alphaNumericRequired,
      alphaNumericInvalid: l10n.alphaNumericInvalid,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateValidationMessages(context);
  }

  void _changeLanguage(String languageCode) {
    MyApp.setLocale(context, Locale(languageCode));
    setState(() {
      _selectedLanguage = languageCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isArabic = _selectedLanguage == 'ar';

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.validationFormTitle),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: _changeLanguage,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'en',
                child: Text('English'),
              ),
              const PopupMenuItem(
                value: 'es',
                child: Text('Español'),
              ),
              const PopupMenuItem(
                value: 'ar',
                child: Text('العربية'),
              ),
            ],
          ),
        ],
      ),
      body: Directionality(
        textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AnimatedFormField(
                  label: l10n.emailLabel,
                  controller: _controllers['email']!,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) =>
                      _validators.userInput.validateConstrainedEmail(
                    value,
                    domain: _selectedEmailDomain,
                    customRequiredMessage: l10n.emailRequired,
                    customInvalidMessage: l10n.invalidEmail,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width:
                              120, // Increased width to accommodate grouped display
                          child: AnimatedSearchableDropdown(
                            label: l10n.countryCodeLabel,
                            value: _selectedCountryCode,
                            displayValue: _getDisplayText(_selectedCountryCode),
                            options:
                                MobileRegex.mobileNumberPatterns.keys.toList(),
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  _selectedCountryCode = value.split(' ').first;
                                });
                              }
                            },
                            onSearch: _filterPatterns,
                            margin: EdgeInsets.zero,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: AnimatedFormField(
                            label: l10n.mobileLabel,
                            controller: _controllers['mobile']!,
                            keyboardType: TextInputType.phone,
                            validator: (value) =>
                                _validators.userInput.validateMobileNumber(
                              value,
                              prefix: _selectedCountryCode,
                              customRequiredMessage: l10n.mobileNumberRequired,
                              customInvalidMessage: l10n.invalidMobileNumber,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedFormField(
                  label: l10n.passwordLabel,
                  controller: _controllers['password']!,
                  obscureText: true,
                  validator: (value) => _validators.userInput.validatePassword(
                    value,
                    minLength: 8,
                    customMinLengthMessage: l10n.passwordMinLength(10),
                    customUppercaseMessage: l10n.passwordUppercase,
                    customDigitMessage: l10n.passwordDigit,
                    customSpecialCharMessage: l10n.passwordSpecialChar,
                  ),
                ),
                AnimatedFormField(
                  label: l10n.usernameLabel,
                  controller: _controllers['username']!,
                  validator: (value) => _validators.userInput.validateUsername(
                    value,
                    customRequiredMessage: l10n.usernameRequired,
                    customInvalidMessage: l10n.usernameInvalid,
                  ),
                ),
                AnimatedFormField(
                  label: l10n.fullNameLabel,
                  controller: _controllers['fullName']!,
                  validator: (value) => _validators.userInput.validateFullName(
                    value,
                    customRequiredMessage: l10n.fullNameRequired,
                    customInvalidMessage: l10n.fullNameInvalid,
                  ),
                ),
                AnimatedFormField(
                  label: l10n.creditCardLabel,
                  controller: _controllers['creditCard']!,
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      _validators.userInput.validateCreditCard(
                    value,
                    customRequiredMessage: l10n.creditCardRequired,
                    customInvalidMessage: l10n.invalidCreditCard,
                  ),
                ),
                AnimatedFormField(
                  label: l10n.urlLabel,
                  controller: _controllers['url']!,
                  keyboardType: TextInputType.url,
                  validator: (value) => _validators.dataType.validateUrl(
                    value,
                    customRequiredMessage: l10n.urlRequired,
                    customInvalidMessage: l10n.invalidUrl,
                  ),
                ),
                AnimatedFormField(
                  label: l10n.dateLabel,
                  controller: _controllers['date']!,
                  validator: (value) => _validators.dataType.validateDate(
                    value,
                    customRequiredMessage: l10n.dateRequired,
                    customInvalidMessage: l10n.invalidDate,
                  ),
                ),
                AnimatedFormField(
                  label: l10n.alphaLabel,
                  controller: _controllers['alpha']!,
                  validator: (value) => _validators.dataType.validateAlpha(
                    value,
                    customRequiredMessage: l10n.alphaRequired,
                    customInvalidMessage: l10n.alphaInvalid,
                  ),
                ),
                AnimatedFormField(
                  label: l10n.alphanumericLabel,
                  controller: _controllers['alphanumeric']!,
                  validator: (value) =>
                      _validators.dataType.validateAlphanumeric(
                    value,
                    customRequiredMessage: l10n.alphaNumericRequired,
                    customInvalidMessage: l10n.alphaNumericInvalid,
                  ),
                ),
                AnimatedFormField(
                  label: l10n.latitudeLabel,
                  controller: _controllers['latitude']!,
                  keyboardType: TextInputType.number,
                  validator: (value) => _validators.location.validateLat(
                    value,
                    customRequiredMessage: l10n.latitudeRequired,
                    customInvalidMessage: l10n.invalidLatitude,
                  ),
                ),
                AnimatedFormField(
                  label: l10n.longitudeLabel,
                  controller: _controllers['longitude']!,
                  keyboardType: TextInputType.number,
                  validator: (value) => _validators.location.validateLong(
                    value,
                    customRequiredMessage: l10n.longitudeRequired,
                    customInvalidMessage: l10n.invalidLongitude,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _handleSubmit,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    l10n.submitButton,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
