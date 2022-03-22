import 'dart:async';

import 'package:app_tdd/injection/config_injection.dart';
import 'package:app_tdd/presentation/cubits/home_page_cubit.dart';
import 'package:app_tdd/presentation/cubits/home_page_state.dart';
import 'package:app_tdd/presentation/screens/home/home_page.dart';
import 'package:app_tdd/presentation/screens/home/widgets/destination_currency_row.dart';
import 'package:app_tdd/presentation/screens/home/widgets/result_box.dart';
import 'package:app_tdd/presentation/screens/home/widgets/source_currency_row.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart' as mocktail;

class MockHomePageCubit extends MockCubit<HomePageState>
    implements HomePageCubit {}

void main() {
  late HomePageState state;
  late MockHomePageCubit mockCubit;

  setUp(() {
    state = HomePageState.initialState();

    mocktail.registerFallbackValue(state);
    mockCubit = MockHomePageCubit();
    getIt.registerFactory<HomePageCubit>(() => mockCubit);

    whenListen(
      mockCubit,
      Stream.value(state),
      initialState: state,
    );
  });

  tearDown(() {
    getIt.reset();
  });

  Future<void> buildApp(
    WidgetTester tester, {
    void Function(String?)? customOnChanged,
  }) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
  }

  testWidgets('should render correctly', (WidgetTester tester) async {
    await buildApp(tester);

    final sourceCurrencyRowFinder = find.byWidgetPredicate((widget) =>
        widget is SourceCurrencyRow &&
        widget.dropdownValue == 'Real' &&
        widget.currencies.length == state.availableCurrencies.length);

    final destinationCurrencyRowFinder = find.byWidgetPredicate((widget) =>
        widget is DestinationCurrencyRow &&
        widget.dropdownValue == 'US Dolar' &&
        widget.currencies.length == state.availableCurrencies.length);

    final textButtonFinder = find.byWidgetPredicate((widget) =>
        widget is TextButton && (widget.child as Text?)?.data == 'Converter');

    final resultBoxFinder = find.byWidgetPredicate(
        (widget) => widget is ResultBox && widget.state == state);

    expect(sourceCurrencyRowFinder, findsOneWidget);
    expect(destinationCurrencyRowFinder, findsOneWidget);
    expect(textButtonFinder, findsOneWidget);
    expect(resultBoxFinder, findsOneWidget);
  });

  testWidgets('should call homePageCubit.convertValue when tap convert button',
      (WidgetTester tester) async {
    await buildApp(tester);

    final textButtonFinder = find.byWidgetPredicate((widget) =>
        widget is TextButton && (widget.child as Text?)?.data == 'Converter');

    await tester.enterText(find.byType(TextField), '4');
    await tester.tap(textButtonFinder);

    mocktail
        .verify(() => mockCubit.convertValue(
              sourceValue: 4.0,
              sourceName: 'Real',
              destinationName: 'US Dolar',
            ))
        .called(1);
  });

  testWidgets(
      'should not call homePageCubit.convertValue when tap convert button and text is empty',
      (WidgetTester tester) async {
    await buildApp(tester);

    final textButtonFinder = find.byWidgetPredicate((widget) =>
        widget is TextButton && (widget.child as Text?)?.data == 'Converter');

    await tester.tap(textButtonFinder);

    mocktail.verifyNever(() => mockCubit.convertValue(
          sourceValue: 4.0,
          sourceName: 'Real',
          destinationName: 'US Dolar',
        ));
  });
}
