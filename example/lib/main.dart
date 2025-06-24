import 'package:boolean_validation/boolean_validation.dart';
import 'package:example/utils/validation_messages_localization.dart';
import 'package:example/widgets/animated_dropdown.dart';
import 'package:example/widgets/animated_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

/// A Flutter application demonstrating various validation features.
/// This example showcases:
/// 1. Internationalization (English, Spanish, Arabic)
/// 2. Email validation with custom domains
/// 3. Password validation with multiple rules
/// 4. Mobile number validation with country codes
/// 5. Credit card validation
/// 6. Username and full name validation
/// 7. Animated form fields
///
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    final state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boolean Validation Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      locale: _locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (context, child) {
        // Update validation messages when locale changes
        final l10n = AppLocalizations.of(context);
        if (l10n != null) {
          ValidationMessages.provider = ARBValidationProvider(l10n);
        }
        return child!;
      },
      home: const ValidationFormScreen(),
    );
  }
}

class ValidationFormScreen extends StatefulWidget {
  const ValidationFormScreen({Key? key}) : super(key: key);

  @override
  State<ValidationFormScreen> createState() => _ValidationFormScreenState();
}

class _ValidationFormScreenState extends State<ValidationFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _validators = Validators();

  // you can use that for predefined domain
  final EmailDomain _selectedEmailDomain = EmailDomain.gmail;

  final String customMailKey = '2math';
  final String customDomain = '2math.com';

  CountryPhonePattern _selectedCountryCode =
      CountryPhonePattern.usa; // Default to US

  @override
  void initState() {
    super.initState();
    EmailDomain.addCustomDomain(customMailKey, customDomain);
  }

  final _controllers = {
    'email': TextEditingController(),
    'emailConstrained': TextEditingController(),
    'mobile': TextEditingController(),
    'countryCode': TextEditingController(),
    'password': TextEditingController(),
    'username': TextEditingController(),
    'fullName': TextEditingController(),
    'arabic_fullName': TextEditingController(),
    'creditCard': TextEditingController(),
    'url': TextEditingController(),
    'date': TextEditingController(),
    'alpha': TextEditingController(),
    'alphanumeric': TextEditingController(),
    'latitude': TextEditingController(),
    'longitude': TextEditingController(),
  };

  void _changeLanguage(String languageCode) =>
      MyApp.setLocale(context, Locale(languageCode));

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        title: Column(
          children: [
            Text(l10n.validationFormTitle),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "This app demonstrates various form validations\nusing the boolean_validation package",
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
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
      body: SingleChildScrollView(
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
                    _validators.userInput.validateEmail(value),
              ),

              ///
              ///
              /// Example with custom messages for this specific field
              ///
              ///
              if (EmailDomain.getDomain(customMailKey) != null)
                AnimatedFormField(
                  label: l10n.email2MathLabel,
                  controller: _controllers['emailConstrained']!,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) =>
                      _validators.userInput.validateConstrainedEmail(
                    value,
                    domain: EmailDomain.getDomain(customMailKey)!,
                    // customRequiredMessage: l10n.emailRequired,
                    // customInvalidMessage: l10n.invalidEmail,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 160),
                        child: SizedBox(
                          width: size.width * .35,
                          // Increased width to accommodate grouped display
                          child:
                              AnimatedSearchableDropdown<CountryPhonePattern>(
                            label: l10n.countryCodeLabel,
                            value: _selectedCountryCode,
                            displayStringForOption: ((s) =>
                                "${s.isoCode} (+${s.dialCode})"),
                            options: CountryPhonePattern.values,
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  _selectedCountryCode = value;
                                });
                              }
                            },
                            onSearch: _filterPatterns,
                            margin: EdgeInsets.zero,
                          ),
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
                            prefix: _selectedCountryCode.dialCode,
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
                  minLength: 20,
                  // customUppercaseMessage: l10n.passwordUppercase,
                  // customDigitMessage: l10n.passwordDigit,
                  // customSpecialCharMessage: l10n.passwordSpecialChar,
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
                validator: (value) =>
                    _validators.userInput.validateFullName(value),
              ),
              AnimatedFormField(
                label: l10n.arabicFullNameLabel,
                controller: _controllers['arabic_fullName']!,
                validator: (value) => _validators.userInput.validateFullName(
                    value,
                    customRequiredMessage: l10n.arabicFullNameRequired,
                    customInvalidMessage: l10n.arabicFullNameInvalid,
                    multiLang: [SupportedLanguage.arabic]),
              ),
              AnimatedFormField(
                label: l10n.creditCardLabel,
                controller: _controllers['creditCard']!,
                keyboardType: TextInputType.number,
                validator: (value) => _validators.userInput.validateCreditCard(
                  value,
                  // customRequiredMessage: l10n.creditCardRequired,
                  // customInvalidMessage: l10n.invalidCreditCard,
                ),
              ),
              AnimatedFormField(
                label: l10n.urlLabel,
                controller: _controllers['url']!,
                keyboardType: TextInputType.url,
                validator: (value) => _validators.dataType.validateUrl(
                  value,
                  // customRequiredMessage: l10n.urlRequired,
                  // customInvalidMessage: l10n.invalidUrl,
                ),
              ),
              AnimatedFormField(
                label: l10n.dateLabel,
                controller: _controllers['date']!,
                validator: (value) => _validators.dataType.validateDate(
                  value,
                  // customRequiredMessage: l10n.dateRequired,
                  // customInvalidMessage: l10n.invalidDate,
                ),
              ),
              AnimatedFormField(
                label: l10n.alphaLabel,
                controller: _controllers['alpha']!,
                validator: (value) => _validators.dataType.validateAlpha(
                  value,
                  customRequiredMessage: l10n.alphaRequired,
                  customInvalidMessage: l10n.alphaInvalid,
                  multiLang: [
                    SupportedLanguage.arabic,
                    SupportedLanguage.english,
                  ],
                ),
              ),
              AnimatedFormField(
                label: l10n.alphanumericLabel,
                controller: _controllers['alphanumeric']!,
                validator: (value) => _validators.dataType.validateAlphanumeric(
                    value,
                    customRequiredMessage: l10n.alphaNumericRequired,
                    customInvalidMessage: l10n.alphaNumericInvalid,
                    useDigitsOfMultiLang: true,
                    mustContainAlpha: true,
                    mustContainDigit: true,
                    multiLang: [
                      SupportedLanguage.arabic,
                      SupportedLanguage.english,
                    ]),
              ),
              AnimatedFormField(
                label: l10n.latitudeLabel,
                controller: _controllers['latitude']!,
                keyboardType: TextInputType.number,
                validator: (value) => _validators.location.validateLat(
                  value,
                  // customRequiredMessage: l10n.latitudeRequired,
                  // customInvalidMessage: l10n.invalidLatitude,
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
    );
  }

  // Filter patterns considering groups
  List<CountryPhonePattern> _filterPatterns(String query) {
    if (query.isEmpty) {
      // Return all country patterns (or sorted by isoCode for consistency)
      return CountryPhonePattern.values.toList();
    }

    final lowercaseQuery = query.toLowerCase();

    return CountryPhonePattern.values.where((pattern) {
      return pattern.name.toLowerCase().contains(lowercaseQuery) ||
          pattern.dialCode.toLowerCase().contains(lowercaseQuery) ||
          pattern.isoCode.toLowerCase().contains(lowercaseQuery);
    }).toList();
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

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }
}
