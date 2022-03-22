import 'dart:async';

import 'package:app_tdd/presentation/screens/home/widgets/currency_dropdown.dart';
import 'package:app_tdd/presentation/screens/home/widgets/destination_currency_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late String dropdownValue;
  late void Function(String?) onChanged;
  late List<String> currencies;

  setUp(() {
    dropdownValue = 'any';
    onChanged = (_) {};
    currencies = const ['any', 'another', 'last'];
  });

  Future<void> buildApp(
    WidgetTester tester, {
    void Function(String?)? customOnChanged,
  }) async {
    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: DestinationCurrencyRow(
          dropdownValue: dropdownValue,
          onChanged: customOnChanged ?? onChanged,
          currencies: currencies,
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

    expect(currencyDropdownFinder, findsOneWidget);
    expect(find.text('Para'), findsOneWidget);
  });

  testWidgets('should do something on change', (WidgetTester tester) async {
    final completer = Completer<void>();

    await buildApp(tester, customOnChanged: completer.complete);

    await tester.tap(find.byType(DestinationCurrencyRow));
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
