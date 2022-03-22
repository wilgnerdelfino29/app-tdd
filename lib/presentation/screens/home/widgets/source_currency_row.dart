import 'package:flutter/material.dart';

import '../../../core/formatters/custom_text_input_formatter.dart';
import 'currency_dropdown.dart';

class SourceCurrencyRow extends StatelessWidget {
  final String dropdownValue;
  final void Function(String?) onChanged;
  final List<String> currencies;
  final TextEditingController sourceValueController;

  const SourceCurrencyRow({
    Key? key,
    required this.dropdownValue,
    required this.onChanged,
    required this.currencies,
    required this.sourceValueController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            width: 50,
            child: Text(
              'De',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            child: CurrencyDropdown(
              dropdownValue: dropdownValue,
              onChanged: onChanged,
              currencies: currencies,
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          SizedBox(
            width: 100,
            child: TextField(
              controller: sourceValueController,
              textAlign: TextAlign.end,
              keyboardType: TextInputType.number,
              inputFormatters: [
                CustomTextInputFormatter.decimalWithDotOrComma,
              ],
              decoration: InputDecoration(
                hintText: '1.00',
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                ),
              ),
              style: const TextStyle(
                fontSize: 20,
              ),
              cursorColor: Colors.black12,
            ),
          ),
        ],
      ),
    );
  }
}
