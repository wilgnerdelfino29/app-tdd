import 'dart:async';

import 'package:app_tdd/presentation/core/formatters/custom_text_input_formatter.dart';
import 'package:app_tdd/presentation/screens/home/widgets/currency_dropdown.dart';
import 'package:app_tdd/presentation/screens/home/widgets/source_currency_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late String dropdownValue;
  late void Function(String?) onChanged;
  late List<String> currencies;
  late TextEditingController sourceValueController;

  setUp(() {
    dropdownValue = 'any';
    onChanged = (_) {};
    currencies = const ['any', 'another', 'last'];
    sourceValueController = TextEditingController();
  });

  Future<void> buildApp(
    WidgetTester tester, {
    void Function(String?)? customOnChanged,
  }) async {
    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: SourceCurrencyRow(
          dropdownValue: dropdownValue,
          onChanged: customOnChanged ?? onChanged,
          currencies: currencies,
          sourceValueController: sourceValueController,
        ),
      ),
    ));
  }

  testWidgets('should render correctly', (WidgetTester tester) async {
    await buildApp(tester);

    final currencyDropdownFinder = find.byWidgetPredicate(
      (widget) =>
          widget is CurrencyDropdown &&
          widget.dropdownValue == dropdownValue &&
          widget.onChanged == onChanged &&
          widget.currencies == currencies,
    );
    final textFieldFinder = find.byWidgetPredicate(
      (widget) =>
          widget is TextField &&
          widget.controller == sourceValueController &&
          widget.keyboardType == TextInputType.number &&
          widget.inputFormatters?.first ==
              CustomTextInputFormatter.decimalWithDotOrComma &&
          widget.decoration?.hintText == '1.00',
    );

    expect(currencyDropdownFinder, findsOneWidget);
    expect(textFieldFinder, findsOneWidget);
    expect(find.text('De'), findsOneWidget);
  });

  testWidgets('should do something on change', (WidgetTester tester) async {
    final completer = Completer<void>();

    await buildApp(tester, customOnChanged: completer.complete);

    await tester.tap(find.byType(CurrencyDropdown));
    await tester.pumpAndSettle();
    await tester.tap(
      find
          .byWidgetPredicate(
              (widget) => widget is Text && widget.data == currencies[1])
          .at(1),
    );

    expect(completer.isCompleted, isTrue);
  });
}
