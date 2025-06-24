# Test Coverage Areas:

## 1. Basic Validation

- Null/empty inputs (required vs not required)
- Invalid formats (alphabetic, mixed, special characters)
- Valid numbers without prefixes

## 2. Custom Messages

- Custom required messages
- Custom invalid messages
- Both custom messages in different scenarios

## 3. Country-Specific Tests

- Major Countries: USA, Canada, India, UK, China with both dial codes and ISO codes
- Arabic Countries: Comprehensive tests for Egypt, Saudi Arabia, UAE, plus samples for Morocco,
  Jordan, Lebanon, Kuwait, Qatar, Bahrain, Oman
- Other Countries: Sample tests for France, Germany, Brazil, Japan, Australia, Russia

## 4. Edge Cases

- Very long/short numbers
- Numbers with zeros
- Various formatting (parentheses, dashes, spaces, dots)
- Plus sign handling and malformed formats

## 5. Prefix Validation

- Invalid/empty prefixes
- Wrong prefix for number format
- Correct prefix matching

## 6. International Formats

- Full international format with country codes
- Various international formatting styles
- Malformed international formats

## 7. Boundary Tests

- Minimum/maximum length validation
- Edge cases around length limits

## 8. Parameter Combinations

- Different combinations of isRequired, prefix, and custom messages
- All parameters combined in various scenarios