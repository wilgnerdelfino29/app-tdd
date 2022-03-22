import 'package:flutter/material.dart';

import 'currency_dropdown.dart';

class DestinationCurrencyRow extends StatelessWidget {
  final String dropdownValue;
  final void Function(String?) onChanged;
  final List<String> currencies;

  const DestinationCurrencyRow({
    Key? key,
    required this.dropdownValue,
    required this.onChanged,
    required this.currencies,
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
              'Para',
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
        ],
      ),
    );
  }
}
