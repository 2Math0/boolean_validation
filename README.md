# boolean_validation

A Dart package providing various validation utilities for common data types.

## Validation Functions

| Function                    | Description                                            | Example Usage                                            |
|-----------------------------|--------------------------------------------------------|----------------------------------------------------------|
| `validateEmail`             | Validates if a string is a properly formatted email.   | `validateEmail('test@example.com')`                      |
| `validateMobileNumber`      | Validates if a string is a valid mobile number.        | `validateMobileNumber('1234567890')`                     |
| `validateInteger`           | Validates if a string is a valid integer.              | `validateInteger('123')`                                 |
| `validateUrl`               | Validates if a string is a properly formatted URL.     | `validateUrl('http://example.com')`                      |
| `validateDate`              | Validates if a string is a valid date (YYYY-MM-DD).    | `validateDate('2020-01-01')`                             |
| `validateCreditCard`        | Validates if a string is a valid credit card number.   | `validateCreditCard('4111111111111111')`                 |
| `validateUsername`          | Validates if a string is a valid username.             | `validateUsername('username_123')`                       |

## Usage

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  boolean_validation: ^1.0.0
```

Import the package in your Dart file:

```dart
import 'package:boolean_validation/boolean_validation.dart';

void main() {
  final Validators validators = Validators();

  // Example: Validate Email
  String? emailValidation = validators.validateEmail(
      'test@example.com', 'Email is required', 'Invalid email');
  print(emailValidation); // Output: null (indicating valid email)
}
```

## Validators Class

### validateEmail

```dart
String? validateEmail(String? value, String? emailRequiredMessage, String? validEmailMessage);
```

- **Description**: Validates if the given string is a properly formatted email.
- **Parameters**:
    - `value`: The email string to validate.
    - `emailRequiredMessage`: Custom message when email is required but not provided.
    - `validEmailMessage`: Custom message when email format is invalid.
- **Returns**: Error message if invalid, `null` if valid.

### validateMobileNumber

```dart
String? validateMobileNumber(String? value, String? mobileRequiredMessage,
    String? validMobileMessage);
```

- **Description**: Validates if the given string is a valid mobile number.
- **Parameters**:
    - `value`: The mobile number string to validate.
    - `mobileRequiredMessage`: Custom message when mobile number is required but not provided.
    - `validMobileMessage`: Custom message when mobile number format is invalid.
- **Returns**: Error message if invalid, `null` if valid.

### validateInteger

```dart
String? validateInteger(String? value, String? integerRequiredMessage);
```

- **Description**: Validates if the given string is a valid integer.
- **Parameters**:
    - `value`: The integer string to validate.
    - `integerRequiredMessage`: Custom message when integer is required but not provided.
- **Returns**: Error message if invalid, `null` if valid.

### validateUrl

```dart
String? validateUrl(String value, String? urlRequiredMessage, String? validUrlMessage);
```

- **Description**: Validates if the given string is a properly formatted URL.
- **Parameters**:
    - `value`: The URL string to validate.
    - `urlRequiredMessage`: Custom message when URL is required but not provided.
    - `validUrlMessage`: Custom message when URL format is invalid.
- **Returns**: Error message if invalid, `null` if valid.

### validateDate

```dart
String? validateDate(String value, String? dateRequiredMessage, String? validDateMessage);
```

- **Description**: Validates if the given string is a valid date in YYYY-MM-DD format.
- **Parameters**:
    - `value`: The date string to validate.
    - `dateRequiredMessage`: Custom message when date is required but not provided.
    - `validDateMessage`: Custom message when date format is invalid.
- **Returns**: Error message if invalid, `null` if valid.

### validateCreditCard

```dart
String? validateCreditCard(String value, String? cardRequiredMessage, String? validCardMessage);
```

- **Description**: Validates if the given string is a valid credit card number.
- **Parameters**:
    - `value`: The credit card number string to validate.
    - `cardRequiredMessage`: Custom message when credit card number is required but not provided.
    - `validCardMessage`: Custom message when credit card number is invalid.
- **Returns**: Error message if invalid, `null` if valid.

### validateUsername

```dart
String? validateUsername(String value, String? usernameRequiredMessage,
    String? validUsernameMessage);
```

- **Description**: Validates if the given string is a valid username.
- **Parameters**:
    - `value`: The username string to validate.
    - `usernameRequiredMessage`: Custom message when username is required but not provided.
    - `validUsernameMessage`: Custom message when username format is invalid.
- **Returns**: Error message if invalid, `null` if valid.

