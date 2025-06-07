import 'package:boolean_validation/boolean_validation.dart';
import 'package:flutter/material.dart';

class ShowCaseForMixinValidator extends StatefulWidget {
  const ShowCaseForMixinValidator({super.key});

  @override
  State<ShowCaseForMixinValidator> createState() =>
      _ShowCaseForMixinValidatorState();
}

class _ShowCaseForMixinValidatorState extends State<ShowCaseForMixinValidator>
    with ValidationLogic {
  @override
  void initState() {
    super.initState();
    var result = runMultiValidators(validators: [
      isInteger('4'),
      isPositiveNum('4'),
    ]);
    debugPrint("output result is $result");
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
