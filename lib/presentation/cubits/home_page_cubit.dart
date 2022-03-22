import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business/entities/convertion.dart';
import '../../business/usecases/convert_currency.dart';
import 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final ConvertCurrency _convertCurrency;

  HomePageCubit(this._convertCurrency) : super(HomePageState.initialState());

  void convertValue({
    required double sourceValue,
    required String sourceName,
    required String destinationName,
  }) {
    try {
      emit(state.copyWith(errorOccurred: false));

      final sourceId = _getIdByName(sourceName);
      final destinationId = _getIdByName(destinationName);

      final destinationValue = _convertCurrency(Convertion(
        sourceId: sourceId,
        destinationId: destinationId,
        sourceValue: sourceValue,
      ));

      emit(state.copyWith(
        sourceId: sourceId,
        destinationId: destinationId,
        sourceValue: sourceValue,
        destinationValue: destinationValue,
      ));
    } catch (error) {
      emit(state.copyWith(
        errorOccurred: true,
      ));
    }
  }

  String _getIdByName(String name) {
    return state.availableCurrencies
        .firstWhere((currency) => currency.name == name)
        .id;
  }
}
