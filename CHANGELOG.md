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

<hr/>

## [0.1.0] - 2024-09-29

### Added
1) Add `constrained email validation` for specific providers like gmail, yahoo, etc.
2) add more advanced `password validation` for complex stages if developers required them
3) add `lat and long` validations
4) add validation for `Full Name`, `First and Last Name`
5) add Validations for `required fields`
6) add `alpha` and `alpha numeric` validations


<hr/>

## [0.1.1] - 2024-09-29

- changed the License To MPL
- add description in pubspec yaml

<hr/>

## [1.0.0] - 2025-06-7

- Separate the validation messages in another layer to ease localization and override
- Add Validation for Mobile Number depending on country dial or iso code
- Add Validation for alpha in 10 languages 
- Add `double` and `positive number` validators
- Add Github action for complete Example on WebAssembly with (.arb in localization)
- Add String Extension for regex
- add `runMultiValidators()` method in Validation Logic Mixin
- Fix some bugs