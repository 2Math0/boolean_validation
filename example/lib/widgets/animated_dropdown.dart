import 'package:flutter/material.dart';

class AnimatedSearchableDropdown<T extends Object> extends StatelessWidget {
  final String label;
  final T? value;
  final List<T> options;
  final void Function(T?) onChanged;
  final List<T> Function(String) onSearch;
  final String Function(T) displayStringForOption;
  final String? errorText;
  final EdgeInsetsGeometry? margin;

  const AnimatedSearchableDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.options,
    required this.onChanged,
    required this.onSearch,
    required this.displayStringForOption,
    this.errorText,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: margin ?? const EdgeInsets.symmetric(vertical: 8.0),
      child: Autocomplete<T>(
        initialValue: TextEditingValue(
          text: value != null ? displayStringForOption(value!) : '',
        ),
        displayStringForOption: displayStringForOption,
        optionsBuilder: (TextEditingValue textEditingValue) {
          return onSearch(textEditingValue.text);
        },
        onSelected: onChanged,
        fieldViewBuilder:
            (context, textEditingController, focusNode, onFieldSubmitted) {
          // Update the controller if needed
          if (value != null &&
              textEditingController.text != displayStringForOption(value!)) {
            textEditingController.text = displayStringForOption(value!);
          }

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
                  ? Colors.red.withValues(alpha: 0.1)
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
                constraints: const BoxConstraints(maxHeight: 200),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    final option = options.elementAt(index);
                    return InkWell(
                      onTap: () => onSelected(option),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(displayStringForOption(option)),
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
