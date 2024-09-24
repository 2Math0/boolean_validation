## [0.0.1] - 2024-06-11

### Added

- Initial release of the `boolean_validation` package.
- Added `Validators` class with validation methods:
    - `validateEmail` - Validates if a string is a properly formatted email.
    - `validateMobileNumber` - Validates if a string is a valid mobile number.
    - `validateInteger` - Validates if a string is a valid integer.
    - `validateUrl` - Validates if a string is a properly formatted URL.
    - `validateDate` - Validates if a string is a valid date (YYYY-MM-DD).
    - `validateCreditCard` - Validates if a string is a valid credit card number.
    - `validateUsername` - Validates if a string is a valid username.
- Added `ValidationLogic` mixin class with methods:
    - `isValidEmail` - Checks if a string is a valid email format.
    - `isValidName` - Checks if a string is a valid name (letters and spaces only).
    - `isCorrectMobileNumber` - Checks if a string is a valid mobile number format.
    - `isInteger` - Checks if a string can be parsed into an integer.
    - `isValidUrl` - Checks if a string is a valid URL format.
    - `isValidDate` - Checks if a string is a valid date in YYYY-MM-DD format.
    - `isValidCreditCard` - Checks if a string is a valid credit card number using the Luhn
      algorithm.
    - `isValidUsername` - Checks if a string is a valid username (4-20 characters long, letters,
      numbers, underscores).
- Included Luhn algorithm implementation for credit card validation.

### Examples

- Provided an example Flutter app demonstrating how to use the validation methods in a form.

<hr/>

## [0.0.2] - 2024-09-24

- support for version 3.3.2 in flutter

