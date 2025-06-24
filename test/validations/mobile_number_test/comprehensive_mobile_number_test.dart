import '../../test_common_libs.dart';

void main() {
  final validators = Validators().userInput;
  ValidationMessages.copyWith(useGenericRequiredMessage: false);
  final messages = ValidationMessages();

  group('Mobile Number Validation - Comprehensive Test Suite', () {
    // ============================================================================
    // BASIC VALIDATION TESTS
    // ============================================================================

    group('Basic Validation', () {
      test('Valid mobile number without prefix', () {
        expect(
          validators.validateMobileNumber('1234567890'),
          null,
        );
      });

      test('Null input - required by default', () {
        expect(
          validators.validateMobileNumber(null),
          messages.mobileNumberRequired,
        );
      });

      test('Empty string - required by default', () {
        expect(
          validators.validateMobileNumber(''),
          messages.mobileNumberRequired,
        );
      });

      test('Whitespace only - required by default', () {
        expect(
          validators.validateMobileNumber('   '),
          messages.mobileNumberRequired,
        );
      });

      test('Null input - not required', () {
        expect(
          validators.validateMobileNumber(null, isRequired: false),
          null,
        );
      });

      test('Empty string - not required', () {
        expect(
          validators.validateMobileNumber('', isRequired: false),
          null,
        );
      });

      test('Invalid format - alphabetic characters', () {
        expect(
          validators.validateMobileNumber('abcdefghij'),
          messages.invalidMobileNumber,
        );
      });

      test('Invalid format - mixed alphanumeric', () {
        expect(
          validators.validateMobileNumber('12a34b56c78'),
          messages.invalidMobileNumber,
        );
      });

      test('Invalid format - special characters only', () {
        expect(
          validators.validateMobileNumber(r'!@#$%^&*()'),
          messages.invalidMobileNumber,
        );
      });
    });

    // ============================================================================
    // CUSTOM MESSAGE TESTS
    // ============================================================================

    group('Custom Messages', () {
      test('Custom required message', () {
        const customMsg = 'Mobile number is mandatory';
        expect(
          validators.validateMobileNumber(
            null,
            customRequiredMessage: customMsg,
          ),
          customMsg,
        );
      });

      test('Custom invalid message', () {
        const customMsg = 'Please enter a valid mobile number';
        expect(
          validators.validateMobileNumber(
            'invalid',
            customInvalidMessage: customMsg,
          ),
          customMsg,
        );
      });

      test('Both custom messages - required scenario', () {
        const customRequiredMsg = 'Custom required message';
        const customInvalidMsg = 'Custom invalid message';
        expect(
          validators.validateMobileNumber(
            null,
            customRequiredMessage: customRequiredMsg,
            customInvalidMessage: customInvalidMsg,
          ),
          customRequiredMsg,
        );
      });

      test('Both custom messages - invalid scenario', () {
        const customRequiredMsg = 'Custom required message';
        const customInvalidMsg = 'Custom invalid message';
        expect(
          validators.validateMobileNumber(
            'invalid',
            customRequiredMessage: customRequiredMsg,
            customInvalidMessage: customInvalidMsg,
          ),
          customInvalidMsg,
        );
      });
    });

    // ============================================================================
    // COUNTRY-SPECIFIC TESTS - MAJOR COUNTRIES
    // ============================================================================

    group('Country-Specific Validation - Major Countries', () {
      // USA & Canada (shared code +1)
      group('USA & Canada (+1)', () {
        test('Valid USA number with dial code', () {
          expect(
            validators.validateMobileNumber(
              '2125551234',
              prefix: CountryPhonePattern.usa.dialCode,
            ),
            null,
          );
        });

        test('Valid Canada number with dial code', () {
          expect(
            validators.validateMobileNumber(
              '4165551234',
              prefix: CountryPhonePattern.canada.dialCode,
            ),
            null,
          );
        });

        test('Valid USA number with ISO code', () {
          expect(
            validators.validateMobileNumber(
              '2125551234',
              prefix: CountryPhonePattern.usa.isoCode,
            ),
            null,
          );
        });

        test('Invalid USA number - too short', () {
          expect(
            validators.validateMobileNumber(
              '212555',
              prefix: CountryPhonePattern.usa.dialCode,
            ),
            messages.invalidMobileNumber,
          );
        });
      });

      // India (+91)
      group('India (+91)', () {
        test('Valid India number with dial code', () {
          expect(
            validators.validateMobileNumber(
              '9876543210',
              prefix: CountryPhonePattern.india.dialCode,
            ),
            null,
          );
        });

        test('Valid India number with ISO code', () {
          expect(
            validators.validateMobileNumber(
              '9876543210',
              prefix: CountryPhonePattern.india.isoCode,
            ),
            null,
          );
        });

        test('Invalid India number - wrong starting digit', () {
          expect(
            validators.validateMobileNumber(
              '1876543210',
              prefix: CountryPhonePattern.india.dialCode,
            ),
            messages.invalidMobileNumber,
          );
        });
      });

      // UK (+44)
      group('UK (+44)', () {
        test('Valid UK number with dial code', () {
          expect(
            validators.validateMobileNumber(
              '7700900123',
              prefix: CountryPhonePattern.uk.dialCode,
            ),
            null,
          );
        });

        test('Valid UK number with ISO code', () {
          expect(
            validators.validateMobileNumber(
              '7700900123',
              prefix: CountryPhonePattern.uk.isoCode,
            ),
            null,
          );
        });

        test('Invalid UK number - wrong format', () {
          expect(
            validators.validateMobileNumber(
              '1700900123',
              prefix: CountryPhonePattern.uk.dialCode,
            ),
            messages.invalidMobileNumber,
          );
        });
      });

      // China (+86)
      group('China (+86)', () {
        test('Valid China number with dial code', () {
          expect(
            validators.validateMobileNumber(
              '13800138000',
              prefix: CountryPhonePattern.china.dialCode,
            ),
            null,
          );
        });

        test('Valid China number with ISO code', () {
          expect(
            validators.validateMobileNumber(
              '13800138000',
              prefix: CountryPhonePattern.china.isoCode,
            ),
            null,
          );
        });
      });
    });

    // ============================================================================
    // ARABIC COUNTRIES COMPREHENSIVE TESTS
    // ============================================================================

    group('Arabic Countries Validation', () {
      // Egypt (+20) - Detailed tests
      group('Egypt (+20)', () {
        test('Valid Egyptian number with dial code', () {
          expect(
            validators.validateMobileNumber(
              '1234567890',
              prefix: CountryPhonePattern.egypt.dialCode,
            ),
            null,
          );
        });

        test('Valid Egyptian number with ISO code', () {
          expect(
            validators.validateMobileNumber(
              '1234567890',
              prefix: CountryPhonePattern.egypt.isoCode,
            ),
            null,
          );
        });

        test('Valid Egyptian mobile with dial code - without leading 0', () {
          expect(
            validators.validateMobileNumber(
              '1234567890',
              prefix: CountryPhonePattern.egypt.dialCode,
            ),
            null,
          );
        });

        test('Invalid Egyptian mobile with dial code - should not start with 0',
            () {
          expect(
            validators.validateMobileNumber(
              '01234567890',
              prefix: CountryPhonePattern.egypt.dialCode,
            ),
            messages.invalidMobileNumber,
          );
        });

        test('Invalid Egyptian number - wrong length', () {
          expect(
            validators.validateMobileNumber(
              '123456',
              prefix: CountryPhonePattern.egypt.dialCode,
            ),
            messages.invalidMobileNumber,
          );
        });

        test('Valid Egyptian number with country code embedded', () {
          expect(
            validators.validateMobileNumber('201234567890'),
            null,
          );
        });

        test('Valid Egyptian number with + and country code', () {
          expect(
            validators.validateMobileNumber('+201234567890'),
            null,
          );
        });

        test('Valid Egyptian number with formatting', () {
          expect(
            validators.validateMobileNumber('(2012) 345-678-90'),
            null,
          );
        });
      });

      // Saudi Arabia (+966)
      group('Saudi Arabia (+966)', () {
        test('Valid Saudi number with dial code', () {
          expect(
            validators.validateMobileNumber(
              '111234567',
              prefix: CountryPhonePattern.saudiArabia.dialCode,
            ),
            null,
          );
        });

        test('Valid Saudi number with ISO code', () {
          expect(
            validators.validateMobileNumber(
              '517513175',
              prefix: CountryPhonePattern.saudiArabia.isoCode,
            ),
            null,
          );
        });

        test('Valid Saudi number with country code', () {
          expect(
            validators.validateMobileNumber('+966501234567'),
            null,
          );
        });
      });

      // UAE (+971)
      group('UAE (+971)', () {
        test('Valid UAE number with dial code', () {
          expect(
            validators.validateMobileNumber(
              '501234567',
              prefix: CountryPhonePattern.uae.dialCode,
            ),
            null,
          );
        });

        test('Valid UAE number with ISO code', () {
          expect(
            validators.validateMobileNumber(
              '501234567',
              prefix: CountryPhonePattern.uae.isoCode,
            ),
            null,
          );
        });

        test('Valid UAE number with country code', () {
          expect(
            validators.validateMobileNumber('+971501234567'),
            null,
          );
        });
      });

      // Other Arabic Countries - Sample tests
      test('Valid Morocco number', () {
        expect(
          validators.validateMobileNumber(
            '612345678',
            prefix: CountryPhonePattern.morocco.dialCode,
          ),
          null,
        );
      });

      test('Valid Jordan number', () {
        expect(
          validators.validateMobileNumber(
            '791234567',
            prefix: CountryPhonePattern.jordan.dialCode,
          ),
          null,
        );
      });

      test('Valid Lebanon number', () {
        expect(
          validators.validateMobileNumber(
            '71123456',
            prefix: CountryPhonePattern.lebanon.dialCode,
          ),
          null,
        );
      });

      test('Valid Kuwait number', () {
        expect(
          validators.validateMobileNumber(
            '51234567',
            prefix: CountryPhonePattern.kuwait.dialCode,
          ),
          null,
        );
      });

      test('Valid Qatar number', () {
        expect(
          validators.validateMobileNumber(
            '51234567',
            prefix: CountryPhonePattern.qatar.dialCode,
          ),
          null,
        );
      });

      test('Valid Bahrain number', () {
        expect(
          validators.validateMobileNumber(
            '36123456',
            prefix: CountryPhonePattern.bahrain.dialCode,
          ),
          null,
        );
      });

      test('Valid Oman number', () {
        expect(
          validators.validateMobileNumber(
            '91234567',
            prefix: CountryPhonePattern.oman.dialCode,
          ),
          null,
        );
      });
    });

    // ============================================================================
    // OTHER COUNTRIES SAMPLE TESTS
    // ============================================================================

    group('Other Countries Sample Tests', () {
      test('Valid France number', () {
        expect(
          validators.validateMobileNumber(
            '754156587',
            prefix: CountryPhonePattern.france.dialCode,
          ),
          null,
        );
      });

      test('Valid Germany number', () {
        expect(
          validators.validateMobileNumber(
            '1512345678',
            prefix: CountryPhonePattern.germany.dialCode,
          ),
          null,
        );
      });

      test('Valid Brazil number', () {
        expect(
          validators.validateMobileNumber(
            '11987654321',
            prefix: CountryPhonePattern.brazil.dialCode,
          ),
          null,
        );
      });

      test('Valid Japan number', () {
        expect(
          validators.validateMobileNumber(
            '9012345678',
            prefix: CountryPhonePattern.japan.dialCode,
          ),
          null,
        );
      });

      test('Valid Australia number', () {
        expect(
          validators.validateMobileNumber(
            '412345678',
            prefix: CountryPhonePattern.australia.dialCode,
          ),
          null,
        );
      });

      test('Valid Russia number', () {
        expect(
          validators.validateMobileNumber(
            '9161234567',
            prefix: CountryPhonePattern.russia.dialCode,
          ),
          null,
        );
      });
    });

    // ============================================================================
    // EDGE CASES AND SPECIAL SCENARIOS
    // ============================================================================

    group('Edge Cases', () {
      test('Very long number - should be invalid', () {
        expect(
          validators.validateMobileNumber('123456789012345678901234567890'),
          messages.invalidMobileNumber,
        );
      });

      test('Very short number - should be invalid', () {
        expect(
          validators.validateMobileNumber('123'),
          messages.invalidMobileNumber,
        );
      });

      test('Number with only zeros', () {
        expect(
          validators.validateMobileNumber('0000000000'),
          messages.invalidMobileNumber,
        );
      });

      test('Number with leading zeros', () {
        expect(
          validators.validateMobileNumber('0012345678'),
          messages.invalidMobileNumber,
        );
      });

      test('Number with parentheses and dashes', () {
        expect(
          validators.validateMobileNumber('(123) 456-7890'),
          null,
        );
      });

      test('Number with spaces', () {
        expect(
          validators.validateMobileNumber('123 456 7890'),
          null,
        );
      });

      test('Number with dots', () {
        expect(
          validators.validateMobileNumber('123.456.7890'),
          messages.invalidMobileNumber,
        );
      });

      test('Number with plus sign only', () {
        expect(
          validators.validateMobileNumber('+1234567890'),
          null,
        );
      });

      test('Number with multiple plus signs - should be invalid', () {
        expect(
          validators.validateMobileNumber('++1234567890'),
          messages.invalidMobileNumber,
        );
      });

      test('Number with plus in middle - should be invalid', () {
        expect(
          validators.validateMobileNumber('123+4567890'),
          messages.invalidMobileNumber,
        );
      });
    });

    // ============================================================================
    // PREFIX VALIDATION TESTS
    // ============================================================================

    group('Prefix Validation', () {
      test('prefix - empty string', () {
        expect(
          validators.validateMobileNumber('1234567890', prefix: ''),
          null,
        );
      });

      test('Invalid prefix - null', () {
        expect(
          validators.validateMobileNumber('1234567890'),
          null, // Should validate without prefix
        );
      });

      test('Invalid prefix(IGNORED) - non-existent country code', () {
        expect(
          validators.validateMobileNumber('1234567890', prefix: 'XX'),
          null,
        );
      });

      test('Wrong prefix for number format', () {
        expect(
          validators.validateMobileNumber(
            '1234567890',
            prefix: CountryPhonePattern.china.dialCode,
          ),
          messages.invalidMobileNumber,
        );
      });

      test('Correct prefix with correct format', () {
        expect(
          validators.validateMobileNumber(
            '1234567890',
            prefix: CountryPhonePattern.egypt.dialCode,
          ),
          null,
        );
      });
    });

    // ============================================================================
    // INTERNATIONAL FORMAT TESTS
    // ============================================================================

    group('International Format Tests', () {
      test('Full international format - Egypt', () {
        expect(
          validators.validateMobileNumber('+20 123 456 7890'),
          null,
        );
      });

      test('International format without plus - Egypt', () {
        expect(
          validators.validateMobileNumber('20 123 456 7890'),
          null,
        );
      });

      test('International format - USA', () {
        expect(
          validators.validateMobileNumber('+1 212 555 1234'),
          null,
        );
      });

      test('International format - India', () {
        expect(
          validators.validateMobileNumber('+91 98765 43210'),
          null,
        );
      });

      test('International format - Saudi Arabia', () {
        expect(
          validators.validateMobileNumber('+966 50 123 4567'),
          null,
        );
      });

      test('Malformed international format', () {
        expect(
          validators.validateMobileNumber('+ 20 123 456 7890'), // Space after +
          null,
        );
      });
    });

    // ============================================================================
    // BOUNDARY TESTS
    // ============================================================================

    group('Boundary Tests', () {
      const minLength = 8;
      const maxLength = 15;

      test('Valid number with minimum length ($minLength digits)', () {
        final input = '1' * minLength;
        expect(validators.validateMobileNumber(input), null);
      });

      test('Valid number with maximum length ($maxLength digits)', () {
        final input = '1' * maxLength;
        expect(validators.validateMobileNumber(input), null);
      });

      test('Invalid number below minimum length (${minLength - 1} digits)', () {
        final input = '1' * (minLength - 1);
        expect(
          validators.validateMobileNumber(input),
          messages.invalidMobileNumber,
        );
      });

      test('Invalid number above maximum length (${maxLength + 1} digits)', () {
        final input = '1' * (maxLength + 1);
        expect(
          validators.validateMobileNumber(input),
          messages.invalidMobileNumber,
        );
      });

      test('Exactly one digit short of valid (7 digits)', () {
        const input = '1234567'; // 7 digits
        expect(
          validators.validateMobileNumber(input),
          messages.invalidMobileNumber,
        );
      });

      test('Exactly one digit over valid (16 digits)', () {
        const input = '1234567890123456'; // 16 digits
        expect(
          validators.validateMobileNumber(input),
          messages.invalidMobileNumber,
        );
      });
    });

    // ============================================================================
    // COMBINATION TESTS
    // ============================================================================

    group('Parameter Combination Tests', () {
      test('Not required with valid number', () {
        expect(
          validators.validateMobileNumber('1234567890', isRequired: false),
          null,
        );
      });

      test('Not required with invalid number', () {
        expect(
          validators.validateMobileNumber('invalid', isRequired: false),
          messages.invalidMobileNumber,
        );
      });

      test('Not required with empty string', () {
        expect(
          validators.validateMobileNumber('', isRequired: false),
          null,
        );
      });

      test('Custom messages with prefix', () {
        expect(
          validators.validateMobileNumber(
            'invalid',
            prefix: CountryPhonePattern.egypt.dialCode,
            customInvalidMessage: 'Custom invalid message',
          ),
          'Custom invalid message',
        );
      });

      test('All parameters combined - valid case', () {
        expect(
          validators.validateMobileNumber(
            '1234567890',
            prefix: CountryPhonePattern.egypt.dialCode,
            customRequiredMessage: 'Custom required',
            customInvalidMessage: 'Custom invalid',
          ),
          null,
        );
      });

      test('All parameters combined - invalid case', () {
        expect(
          validators.validateMobileNumber(
            'invalid',
            prefix: CountryPhonePattern.egypt.dialCode,
            customRequiredMessage: 'Custom required',
            customInvalidMessage: 'Custom invalid',
          ),
          'Custom invalid',
        );
      });
    });
  });
}
