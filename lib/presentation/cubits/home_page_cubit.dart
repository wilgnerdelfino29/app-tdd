import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business/entities/convertion.dart';
import '../../business/usecases/convert_currency.dart';
import 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final ConvertCurrency _convertCurrency;

  HomePageCubit(this._convertCurrency) : super(HomePageState.initialState());

  void convertValue() {
    try {
      final destinationValue = _convertCurrency(Convertion(
        sourceId: state.sourceId,
        destinationId: state.destinationId,
        sourceValue: state.sourceValue,
      ));

      emit(state.copyWith(
        destinationValue: destinationValue,
      ));
    } catch (error) {
      emit(state.copyWith(
        errorOccurred: true,
      ));
    }
  }
}
