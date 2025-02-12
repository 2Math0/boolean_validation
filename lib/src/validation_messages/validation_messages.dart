  class ValidationMessages {
    String mobileNumberRequired = 'Mobile number is required';
    String fieldIsRequired = 'Field is required';
    String invalidMobileNumber = 'Please enter a valid mobile number';
    String creditCardRequired = 'Credit card number is required';
    String invalidCreditCard = 'Please enter a valid credit card number';

    // Singleton instance
    static final ValidationMessages _instance = ValidationMessages._internal();

    factory ValidationMessages() {
      return _instance;
    }

    // Private constructor
    ValidationMessages._internal();

    // Method to override messages
    void copyWith({
      String? mobileNumberRequired,
      String? invalidMobileNumber,
      String? creditCardRequired,
      String? invalidCreditCard,
    }) {
      this.mobileNumberRequired = mobileNumberRequired ?? this.mobileNumberRequired;
      this.invalidMobileNumber = invalidMobileNumber ?? this.invalidMobileNumber;
      this.creditCardRequired = creditCardRequired ?? this.creditCardRequired;
      this.invalidCreditCard = invalidCreditCard ?? this.invalidCreditCard;
    }
  }