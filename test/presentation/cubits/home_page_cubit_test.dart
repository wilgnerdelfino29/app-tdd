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

  setUp(() {
    mockConvertCurrency = MockConvertCurrency();
    homePageCubit = HomePageCubit(mockConvertCurrency);
    homePageState = HomePageState.initialState();
  });

  group('convertValue', () {
    const destinationValue = 51.0;

    blocTest<HomePageCubit, HomePageState>(
      'should emit states correctly when usecase return a value',
      build: () {
        when(mockConvertCurrency(any)).thenReturn(destinationValue);
        return homePageCubit;
      },
      seed: () => homePageState,
      act: (cubit) => cubit.convertValue(),
      expect: () {
        return [
          homePageState.copyWith(
            destinationValue: destinationValue,
          )
        ];
      },
    );
  });
}
