import 'package:flutter/material.dart';

class CurrencyDropdown extends StatelessWidget {
  final String dropdownValue;
  final void Function(String?) onChanged;
  final List<String> currencies;

  const CurrencyDropdown({
    Key? key,
    required this.dropdownValue,
    required this.onChanged,
    required this.currencies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: DropdownButton<String>(
        value: dropdownValue,
        elevation: 4,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black54,
        ),
        underline: Container(height: 1, color: Colors.black38),
        onChanged: onChanged,
        items: currencies.map<DropdownMenuItem<String>>((String currency) {
          return DropdownMenuItem<String>(
            value: currency,
            child: Text(currency),
          );
        }).toList(),
      ),
    );
  }
}
