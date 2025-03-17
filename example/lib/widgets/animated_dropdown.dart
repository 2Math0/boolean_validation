import 'package:flutter/material.dart';
import 'package:boolean_validation/boolean_validation.dart';

class AnimatedSearchableDropdown extends StatelessWidget {
  final String label;
  final String value;
  final String displayValue;
  final List<String> options;
  final void Function(String?) onChanged;
  final List<String> Function(String) onSearch;
  final String? errorText;
  final EdgeInsetsGeometry? margin;

  const AnimatedSearchableDropdown({
    Key? key,
    required this.label,
    required this.value,
    required this.displayValue,
    required this.options,
    required this.onChanged,
    required this.onSearch,
    this.errorText,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: margin ?? const EdgeInsets.symmetric(vertical: 8.0),
      child: Autocomplete<String>(
        initialValue: TextEditingValue(text: value),
        optionsBuilder: (TextEditingValue textEditingValue) {
          return onSearch(textEditingValue.text);
        },
        onSelected: onChanged,
        fieldViewBuilder:
            (context, textEditingController, focusNode, onFieldSubmitted) {
          return TextFormField(
            controller: textEditingController,
            focusNode: focusNode,
            decoration: InputDecoration(
              labelText: label,
              errorText: errorText,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: errorText != null ? Colors.red : Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: errorText != null
                      ? Colors.red
                      : Theme.of(context).primaryColor,
                  width: 2,
                ),
              ),
              suffixIcon: const Icon(Icons.arrow_drop_down),
              filled: true,
              fillColor: errorText != null
                  ? Colors.red.withOpacity(0.1)
                  : Theme.of(context).inputDecorationTheme.fillColor,
            ),
          );
        },
        optionsViewBuilder: (context, onSelected, options) {
          return Align(
            alignment: Alignment.topLeft,
            child: Material(
              elevation: 4,
              child: ConstrainedBox(
                constraints:
                    const BoxConstraints(maxHeight: 200, maxWidth: 150),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    final option = options.elementAt(index);
                    return InkWell(
                      onTap: () {
                        onSelected(option);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(option),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
