A powerful and flexible Flutter validation library designed to simplify form validation, provide
clear user feedback, and support internationalization out of the box.

## I basically build this Package so Devs can use

1. **Comprehensive Validators**: A rich set of built-in validators for common use cases like emails, passwords, phone numbers, names, URLs, and more.
2. **Easy Integration**: Use validators directly within `TextFormField` or get a simple `bool` result using `isValid` methods for any validation logic.
3. **Customizable Messages**: Easily override default validation messages globally, per-validator, or for specific fields.
4. **Internationalization (i18n)**: Built-in support for localization. Default messages are provided in English, with the ability to add and use your own translations.
5. **Multi-language Character Support**: Validate names and text in over **25** languages.
6. **Advanced Phone Number Validation**: Supports validation for **35+** country codes.
7. **Custom Logic**: Chain multiple validation rules together for complex scenarios.

## Table of Contents

- [Boolean Validation](#boolean-validation)
  - [I basically build this Package so Devs can use](#i-basically-build-this-package-so-devs-can-use)
  - [Table of Contents](#table-of-contents)
  - [Getting Started](#getting-started)
    - [Installation](#installation)
    - [Basic Usage](#basic-usage)
      - [1. Inside a `TextFormField`](#1-inside-a-textformfield)
      - [2. Direct `isValid` Checks](#2-direct-isvalid-checks)
  - [Customization](#customization)
    - [Global Custom Messages](#global-custom-messages)
    - [Per-Field Custom Messages](#per-field-custom-messages)
  - [Available Validators](#available-validators)
    - [User Input Validators](#user-input-validators)
    - [Data Type Validators](#data-type-validators)
    - [Location Validators](#location-validators)
  - [Advanced Usage \& Parameters](#advanced-usage--parameters)
    - [Email (Constrained Domain)](#email-constrained-domain)
    - [Mobile Number](#mobile-number)
    - [Password](#password)
    - [Name](#name)
    - [Chaining Validators](#chaining-validators)
  - [Example App](#example-app)
  - [Visual Architecture](#visual-architecture)
  - [Contributing](#contributing)
  - [License](#license)

## Getting Started

### Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  boolean_validation: ^1.1.0
```

Then, run `flutter pub get` in your terminal.

### Basic Usage

Import the package and use the `Validators` singleton to access all validation methods.

#### 1. Inside a `TextFormField`

```dart
import 'package:boolean_validation/boolean_validation.dart';
import 'package:flutter/material.dart';

final validators = Validators(); // Access the singleton instance

class MyForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(labelText: 'Email'),
      validator: (value) => validators.userInput.validateEmail(value),
    );
  }
}
```

#### 2. Direct `isValid` Checks

For logic outside of forms, every `validate...` method has a corresponding `is...Valid` method.

```dart
import 'package:boolean_validation/boolean_validation.dart';

class WrapperClass with ValidationLogic {
  final validators = Validators();

// The `isValid` singleton gives you direct access to boolean checks
  if(isValidEmail('someEmail')) {
  print('Email is valid!');
  }

// You can also use the boolean extensions on String
  if (isValidPassword('password')) {
  print('Password is strong enough!');
  }
}
```

## Customization

### Global Custom Messages

Override messages globally when your app starts.

```dart
import 'package:boolean_validation/boolean_validation.dart';

void main() {
  final messages = ValidationMessages();
  messages.copyWith(invalidEmail: 'This not a valid email');
  
  //Or override the ValidationMessageProvider class
  runApp(MyApp());
}
```

### Per-Field Custom Messages

Provide a custom message directly in the validator method to override any global setting.

```dart
TextFormField(
  validator: (value) => validators.userInput.validateEmail(
    value,
    customInvalidMessage: 'That doesn\'t look like an email address.',
    customRequiredMessage: 'We need your email!',
  ),
)
```

For a complete guide on setting up internationalization with ARB files, please see the `example` application.

## Available Validators

### User Input Validators

| Validator                  | Description                                                                                             |
|----------------------------|---------------------------------------------------------------------------------------------------------|
| `validateEmail`            | Validates standard email formats.                                                                       |
| `validateConstrainedEmail` | Validates an email against a specific domain.                                                           |
| `validateMobileNumber`     | Validates a mobile number based on a country's pattern.                                                 |
| `validateCreditCard`       | Validates credit card numbers using the Luhn algorithm.                                                 |
| `validatePassword`         | Checks for password strength (length, uppercase, digits, special characters).                           |
| `validateUsername`         | Validates usernames based on length and allowed characters.                                             |
| `validateFullName`         | Ensures the input contains at least two alphabetic words.                                               |
| `validateName`             | Ensures the input contains a single alphabetic word.                                                    |

### Data Type Validators

| Validator              | Description                                                          |
|------------------------|----------------------------------------------------------------------|
| `validateUrl`          | Validates URL formats.                                               |
| `validateDate`         | Validates date strings in `YYYY-MM-DD` format.                       |
| `validateInteger`      | Checks if the input is a valid integer.                              |
| `validateDouble`       | Checks if the input is a valid double/decimal number.                |
| `validatePositiveNum`  | Checks if the input is a number greater than zero.                   |
| `validateAlpha`        | Checks if the string contains only alphabetic characters.            |
| `validateAlphanumeric` | Checks if the string contains only alphanumeric characters.          |

### Location Validators

| Validator       | Description                                        |
|-----------------|----------------------------------------------------|
| `validateLat`   | Validates a geographic latitude value (-90 to 90). |
| `validateLong`  | Validates a geographic longitude value (-180 to 180).|

## Advanced Usage & Parameters

### Email (Constrained Domain)

```dart
String? validateConstrainedEmail(String? value, {
  required EmailDomain domain,
  bool isRequired = true,
  String? customRequiredMessage,
  String? customInvalidMessage,
});
```

| Parameter               | Type          | Description                                    |
|-------------------------|---------------|------------------------------------------------|
| `value`                 | `String?`     | Email to validate                              |
| `domain`                | `EmailDomain` | Required domain (e.g., `EmailDomain.gmail()`)  |
| `customRequiredMessage` | `String?`     | Custom message if the field is empty.          |
| `customInvalidMessage`  | `String?`     | Custom message if the email format is invalid. |

---

### Mobile Number

```dart
String? validateMobileNumber(String? value, {
  bool isRequired = true,
  String? customRequiredMessage,
  String? customInvalidMessage,
  String? prefix,
});
```

| Parameter               | Type      | Description                                                    |
|-------------------------|-----------|----------------------------------------------------------------|
| `value`                 | `String?` | Mobile number to validate                                      |
| `prefix`                | `String?` | Country code to validate against (`CountryPhonePattern` enum)  |
| `customRequiredMessage` | `String?` | Custom message when empty.                                     |
| `customInvalidMessage`  | `String?` | Custom message when invalid.                                   |

---

### Password

```dart
String? validatePassword(String? value, {
  int minLength = 8,
  bool requireUppercase = true,
  String? customUppercaseMessage,
  bool requireDigit = true,
  String? customDigitMessage,
  bool requireSpecialChar = true,
  String? customSpecialCharMessage,
});
```

| Parameter                  | Type      | Default | Description                                           |
|----------------------------|-----------|---------|-------------------------------------------------------|
| `value`                    | `String?` | -       | Password to validate                                  |
| `minLength`                | `int`     | 8       | Minimum required length.                              |
| `requireUppercase`         | `bool`    | true    | If an uppercase letter is required.                   |
| `requireDigit`             | `bool`    | true    | If a digit is required.                               |
| `requireSpecialChar`       | `bool`    | true    | If a special character is required.                   |
| `custom...Message`         | `String?` | -       | Custom message for a specific failed validation rule. |

---

### Name

```dart
String? validateName(String? value, {
  bool isRequired = true,
  String? customRequiredMessage,
  String? customInvalidMessage,
  List<SupportedLanguage> multiLang = const [SupportedLanguage.english],
});
```

| Parameter               | Type                      | Default                         | Description                                         |
|-------------------------|---------------------------|---------------------------------|-----------------------------------------------------|
| `value`                 | `String?`                 | –                               | The name input to validate.                         |
| `multiLang`             | `List<SupportedLanguage>` | `[SupportedLanguage.english]`   | List of allowed languages for character validation. |
| `customRequiredMessage` | `String?`                 | `messages.nameRequired`         | Custom error message if the field is empty.         |
| `customInvalidMessage`  | `String?`                 | `messages.nameMustBeAlphabetic` | Custom error message for invalid characters.        |

---

### Chaining Validators

Use `runMultiValidators` for complex scenarios where multiple conditions must be met.

```dart
String? validateCustomField(String? value) {
  final success = isValid.runMultiValidators(
    validators: [
      () => isValid.notEmpty(value),
      () => isValid.email(value, domain: EmailDomain.custom('2math.io')),
    ],
  );

  if (!success) {
    return 'Must be a valid email ending in @2math.io';
  }
  return null;
}
```

## Example App

This repository includes a [comprehensive example application](./example) and [live example](https://2math0.github.io/boolean_validation/) that demonstrates all major features of the library, including a complete validation form, i18n setup, a language switcher, and a searchable country code dropdown.

## Visual Architecture

Note: The diagram below is a static image for compatibility with `pub.dev`.
<br/>

![Auto Docs](https://img.shields.io/badge/docs-auto--generated-blueviolet)
<img src="https://raw.githubusercontent.com/2Math0/boolean_validation/master/doc/simplified_arch.svg" alt="Simplified Architecture Diagram" />

A full, detailed diagram of the package architecture can be found here:
![Architecture Diagram](https://raw.githubusercontent.com/2Math0/boolean_validation/6acd142dc224ab1de59a18a197658c8e3169282b/doc/full_diagram.svg)

## Contributing

Contributions are welcome! If you find a bug or have a feature request, please open an issue. If you want to contribute code, please open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.
