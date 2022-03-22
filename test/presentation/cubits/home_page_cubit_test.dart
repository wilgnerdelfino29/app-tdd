import 'package:app_tdd/business/entities/currency.dart';
import 'package:app_tdd/business/usecases/convert_currency.dart';
import 'package:app_tdd/presentation/cubits/home_page_cubit.dart';
import 'package:app_tdd/presentation/cubits/home_page_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import './home_page_cubit_test.mocks.dart';

@GenerateMocks([ConvertCurrency])
void main() {
  late HomePageCubit homePageCubit;
  late HomePageState homePageState;
  late MockConvertCurrency mockConvertCurrency;
  late List<Currency> currencies;

  setUp(() {
    mockConvertCurrency = MockConvertCurrency();
    homePageCubit = HomePageCubit(mockConvertCurrency);
    homePageState = HomePageState.initialState();
    currencies = homePageState.availableCurrencies;
  });

  group('convertValue', () {
    const destinationValue = 51.0;
    const sourceValue = 1.0;

    blocTest<HomePageCubit, HomePageState>(
      'should emit states correctly when usecase return a value',
      build: () {
        when(mockConvertCurrency(any)).thenReturn(destinationValue);
        return homePageCubit;
      },
      seed: () => homePageState,
      act: (cubit) => cubit.convertValue(
        sourceValue: sourceValue,
        sourceName: currencies.first.name,
        destinationName: currencies.last.name,
      ),
      expect: () {
        return [
          homePageState.copyWith(
            sourceId: currencies.first.id,
            destinationId: currencies.last.id,
            sourceValue: sourceValue,
            destinationValue: destinationValue,
          )
        ];
      },
    );

    blocTest<HomePageCubit, HomePageState>(
      'should emit error state when error occurr',
      build: () {
        when(mockConvertCurrency(any)).thenThrow(Exception);
        return homePageCubit;
      },
      seed: () => homePageState,
      act: (cubit) => cubit.convertValue(
        sourceValue: sourceValue,
        sourceName: currencies.first.name,
        destinationName: currencies.last.name,
      ),
      expect: () {
        return [
          homePageState.copyWith(
            errorOccurred: true,
          )
        ];
      },
    );
  });
}
