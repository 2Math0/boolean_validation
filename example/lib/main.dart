import 'package:flutter/material.dart';
import 'package:boolean_validation/boolean_validation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:animate_do/animate_do.dart';

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
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Validation Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
        Locale('ar'),
      ],
      home: const ValidationForm(),
    );
  }
}

/// A form demonstrating various validation features.
class ValidationForm extends StatefulWidget {
  const ValidationForm({super.key});

  @override
  ValidationFormState createState() => ValidationFormState();
}

class ValidationFormState extends State<ValidationForm> {
  final _formKey = GlobalKey<FormState>();
  final Validators _validators = Validators();
  final ValidationMessages _validationMessages = ValidationMessages();
  String _selectedLanguage = 'en';
  EmailDomain _selectedEmailDomain = EmailDomain.gmail;

  // Form controllers
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _creditCardController = TextEditingController();

  // Available email domains using the EmailDomain enum
  final List<EmailDomain> _emailDomains = [
    EmailDomain.gmail,
    EmailDomain.yahoo,
    EmailDomain.hotmail,
    EmailDomain.outlook,
    EmailDomain.custom('company.com'), // Example of custom domain
  ];

  @override
  void initState() {
    super.initState();
    // Initialize validation messages based on selected language
    _updateValidationMessages();
  }

  /// Updates validation messages based on selected language
  void _updateValidationMessages() {
    switch (_selectedLanguage) {
      case 'en':
        ValidationMessages().copyWith(
          emailRequired: 'Email is required',
          invalidEmail: 'Invalid email',
          mobileNumberRequired: 'Mobile number is required',
          invalidMobileNumber: 'Invalid mobile number',
          passwordMinLength: 'Password must be at least {minLength} characters',
          passwordUppercase:
              'Password must contain at least one uppercase letter',
          passwordLowercase:
              'Password must contain at least one lowercase letter',
          passwordDigit: 'Password must contain at least one digit',
          passwordSpecialChar:
              'Password must contain at least one special character',
          usernameRequired: 'Username is required',
          usernameInvalid:
              'Username must be 4-20 characters and can include letters, numbers, and underscores',
          fullNameRequired: 'Full name is required',
          fullNameInvalid: 'Please enter your full name',
          creditCardRequired: 'Credit card number is required',
          invalidCreditCard: 'Invalid credit card number',
        );
        break;
      case 'es':
        ValidationMessages().copyWith(
          emailRequired: 'El correo electrónico es requerido',
          invalidEmail: 'Correo electrónico inválido',
          mobileNumberRequired: 'El número de móvil es requerido',
          invalidMobileNumber: 'Número de móvil inválido',
          passwordMinLength:
              'La contraseña debe tener al menos {minLength} caracteres',
          passwordUppercase:
              'La contraseña debe contener al menos una letra mayúscula',
          passwordLowercase:
              'La contraseña debe contener al menos una letra minúscula',
          passwordDigit: 'La contraseña debe contener al menos un número',
          passwordSpecialChar:
              'La contraseña debe contener al menos un carácter especial',
          usernameRequired: 'El nombre de usuario es requerido',
          usernameInvalid:
              'El nombre de usuario debe tener entre 4-20 caracteres y puede incluir letras, números y guiones bajos',
          fullNameRequired: 'El nombre completo es requerido',
          fullNameInvalid: 'Por favor ingrese su nombre completo',
          creditCardRequired: 'El número de tarjeta de crédito es requerido',
          invalidCreditCard: 'Número de tarjeta de crédito inválido',
        );
        break;
      case 'ar':
        ValidationMessages().copyWith(
          emailRequired: 'البريد الإلكتروني مطلوب',
          invalidEmail: 'البريد الإلكتروني غير صالح',
          mobileNumberRequired: 'رقم الجوال مطلوب',
          invalidMobileNumber: 'رقم الجوال غير صالح',
          passwordMinLength:
              'يجب أن تحتوي كلمة المرور على {minLength} أحرف على الأقل',
          passwordUppercase:
              'يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل',
          passwordLowercase:
              'يجب أن تحتوي كلمة المرور على حرف صغير واحد على الأقل',
          passwordDigit: 'يجب أن تحتوي كلمة المرور على رقم واحد على الأقل',
          passwordSpecialChar:
              'يجب أن تحتوي كلمة المرور على رمز خاص واحد على الأقل',
          usernameRequired: 'اسم المستخدم مطلوب',
          usernameInvalid:
              'يجب أن يكون اسم المستخدم بين 4-20 حرفًا ويمكن أن يتضمن أحرف وأرقام وشرطات سفلية',
          fullNameRequired: 'الاسم الكامل مطلوب',
          fullNameInvalid: 'الرجاء إدخال الاسم الكامل',
          creditCardRequired: 'رقم بطاقة الائتمان مطلوب',
          invalidCreditCard: 'رقم بطاقة الائتمان غير صالح',
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isArabic = _selectedLanguage == 'ar';

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                _selectedLanguage = value;
                _updateValidationMessages();
              });
            },
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
      body: FadeIn(
        duration: const Duration(milliseconds: 500),
        child: Directionality(
          textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  _buildAnimatedTextField(
                    controller: _emailController,
                    label: l10n.emailLabel,
                    validator: (value) =>
                        _validators.userInput.validateConstrainedEmail(
                      value,
                      domain: _selectedEmailDomain,
                      customRequiredMessage: _validationMessages.emailRequired,
                      customInvalidMessage: _validationMessages.invalidEmail,
                    ),
                  ),
                  _buildDomainDropdown(l10n),
                  _buildAnimatedTextField(
                    controller: _mobileController,
                    label: l10n.mobileLabel,
                    validator: (value) =>
                        _validators.userInput.validateMobileNumber(
                      value,
                      customRequiredMessage:
                          _validationMessages.mobileNumberRequired,
                      customInvalidMessage:
                          _validationMessages.invalidMobileNumber,
                    ),
                  ),
                  _buildAnimatedTextField(
                    controller: _passwordController,
                    label: l10n.passwordLabel,
                    obscureText: true,
                    validator: (value) =>
                        _validators.userInput.validatePassword(
                      value,
                      minLength: 8,
                      customMinLengthMessage:
                          _validationMessages.passwordMinLength,
                      customUppercaseMessage:
                          _validationMessages.passwordUppercase,
                      customDigitMessage: _validationMessages.passwordDigit,
                      customSpecialCharMessage:
                          _validationMessages.passwordSpecialChar,
                    ),
                  ),
                  _buildAnimatedTextField(
                    controller: _usernameController,
                    label: l10n.usernameLabel,
                    validator: (value) =>
                        _validators.userInput.validateUsername(
                      value,
                      customRequiredMessage:
                          _validationMessages.usernameRequired,
                      customInvalidMessage: _validationMessages.usernameInvalid,
                    ),
                  ),
                  _buildAnimatedTextField(
                    controller: _fullNameController,
                    label: l10n.fullNameLabel,
                    validator: (value) =>
                        _validators.userInput.validateFullName(
                      value,
                      customRequiredMessage:
                          _validationMessages.fullNameRequired,
                      customInvalidMessage: _validationMessages.fullNameInvalid,
                    ),
                  ),
                  _buildAnimatedTextField(
                    controller: _creditCardController,
                    label: l10n.creditCardLabel,
                    validator: (value) =>
                        _validators.userInput.validateCreditCard(
                      value,
                      customRequiredMessage:
                          _validationMessages.creditCardRequired,
                      customInvalidMessage:
                          _validationMessages.invalidCreditCard,
                    ),
                  ),
                  const SizedBox(height: 20),
                  FadeInUp(
                    delay: const Duration(milliseconds: 300),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(l10n.validationSuccess),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                      },
                      child: Text(l10n.validateButton),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Builds an animated text field with validation
  Widget _buildAnimatedTextField({
    required TextEditingController controller,
    required String label,
    required String? Function(String?) validator,
    bool obscureText = false,
  }) {
    return FadeInUp(
      duration: const Duration(milliseconds: 500),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
          ),
          validator: validator,
          obscureText: obscureText,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ),
    );
  }

  /// Builds a dropdown for selecting email domains
  Widget _buildDomainDropdown(AppLocalizations l10n) {
    return FadeInUp(
      duration: const Duration(milliseconds: 500),
      child: DropdownButtonFormField<EmailDomain>(
        value: _selectedEmailDomain,
        decoration: InputDecoration(
          labelText: l10n.selectEmailDomain,
          border: const OutlineInputBorder(),
        ),
        items: _emailDomains.map((domain) {
          return DropdownMenuItem(
            value: domain,
            child: Text(domain.domain),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            _selectedEmailDomain = value!;
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _mobileController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _fullNameController.dispose();
    _creditCardController.dispose();
    super.dispose();
  }
}
