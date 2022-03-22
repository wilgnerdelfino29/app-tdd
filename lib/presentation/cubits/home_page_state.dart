import 'package:equatable/equatable.dart';

import '../../business/entities/currency.dart';

class HomePageState with EquatableMixin {
  final String sourceId;
  final String destinationId;
  final double sourceValue;
  final double destinationValue;
  final bool errorOccurred;
  final List<Currency> availableCurrencies;

  HomePageState({
    required this.sourceId,
    required this.destinationId,
    required this.sourceValue,
    required this.destinationValue,
    required this.errorOccurred,
    required this.availableCurrencies,
  });

  factory HomePageState.initialState() => HomePageState(
        sourceId: '',
        destinationId: '',
        sourceValue: 0,
        destinationValue: 0,
        errorOccurred: false,
        availableCurrencies: [
          Currency(id: 'BRL', name: 'Real'),
          Currency(id: 'USD', name: 'US Dolar'),
          Currency(id: 'EUR', name: 'Euro'),
        ],
      );

  HomePageState copyWith({
    String? sourceId,
    String? destinationId,
    double? sourceValue,
    double? destinationValue,
    bool? errorOccurred,
    List<Currency>? availableCurrencies,
  }) =>
      HomePageState(
        sourceId: sourceId ?? this.sourceId,
        destinationId: destinationId ?? this.destinationId,
        sourceValue: sourceValue ?? this.sourceValue,
        destinationValue: destinationValue ?? this.destinationValue,
        errorOccurred: errorOccurred ?? this.errorOccurred,
        availableCurrencies: availableCurrencies ?? this.availableCurrencies,
      );

  @override
  List<Object?> get props => [
        sourceId,
        destinationId,
        sourceValue,
        destinationValue,
        errorOccurred,
        availableCurrencies,
      ];
}
