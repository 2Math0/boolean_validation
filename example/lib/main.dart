import 'package:flutter/material.dart';
import 'package:boolean_validation/boolean_validation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Validation Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ValidationForm(),
    );
  }
}

class ValidationForm extends StatefulWidget {
  const ValidationForm({super.key});

  @override
  ValidationFormState createState() => ValidationFormState();
}

class ValidationFormState extends State<ValidationForm> {
  final _formKey = GlobalKey<FormState>();
  final Validators _validators = Validators();

  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _integerController = TextEditingController();
  final _urlController = TextEditingController();
  final _dateController = TextEditingController();
  final _creditCardController = TextEditingController();
  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validation Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _buildTextField(
                controller: _emailController,
                label: 'Email',
                validator: (value) => _validators.userInput.validateEmail(
                  value,
                  customRequiredMessage: 'Email is required',
                  customInvalidMessage: 'Invalid email',
                ),
              ),
              _buildTextField(
                controller: _mobileController,
                label: 'Mobile Number',
                validator: (value) => _validators.validateMobileNumber(
                  value,
                  customRequiredMessage: 'Mobile number is required',
                  customInvalidMessage: 'Invalid mobile number',
                ),
              ),
              _buildTextField(
                controller: _integerController,
                label: 'Integer',
                validator: (value) => _validators.dataType.validateInteger(
                  value,
                  customRequiredMessage: 'Number is required',
                ),
              ),
              _buildTextField(
                controller: _urlController,
                label: 'URL',
                validator: (value) => _validators.dataType.validateUrl(
                  value!,
                  customRequiredMessage: 'URL is required',
                  customInvalidMessage: 'Invalid URL',
                  isRequired: true,
                ),
              ),
              _buildTextField(
                controller: _dateController,
                label: 'Date (YYYY-MM-DD)',
                validator: (value) => _validators.dataType.validateDate(
                  value!,
                  customRequiredMessage: 'Date is required',
                  customInvalidMessage: 'Invalid date',
                ),
              ),
              _buildTextField(
                controller: _creditCardController,
                label: 'Credit Card Number',
                validator: (value) => _validators.validateCreditCard(
                  value!,
                  customRequiredMessage: 'Credit card number is required',
                  customInvalidMessage: 'Invalid credit card number',
                ),
              ),
              _buildTextField(
                controller: _usernameController,
                label: 'Username',
                validator: (value) => _validators.userInput.validateUsername(
                  value!,
                  customRequiredMessage: 'Username is required',
                  customInvalidMessage: 'Invalid username',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('All validations passed!')),
                    );
                  }
                },
                child: const Text('Validate'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      validator: validator,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _mobileController.dispose();
    _integerController.dispose();
    _urlController.dispose();
    _dateController.dispose();
    _creditCardController.dispose();
    _usernameController.dispose();
    super.dispose();
  }
}
