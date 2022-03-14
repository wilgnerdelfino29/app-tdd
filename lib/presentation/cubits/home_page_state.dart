import 'package:equatable/equatable.dart';

class HomePageState with EquatableMixin {
  final String sourceId;
  final String destinationId;
  final double sourceValue;
  final double destinationValue;
  final bool errorOccurred;

  HomePageState({
    required this.sourceId,
    required this.destinationId,
    required this.sourceValue,
    required this.destinationValue,
    required this.errorOccurred,
  });

  factory HomePageState.initialState() => HomePageState(
        sourceId: '',
        destinationId: '',
        sourceValue: 0,
        destinationValue: 0,
        errorOccurred: false,
      );

  HomePageState copyWith({
    String? sourceId,
    String? destinationId,
    double? sourceValue,
    double? destinationValue,
    bool? errorOccurred,
  }) =>
      HomePageState(
        sourceId: sourceId ?? this.sourceId,
        destinationId: destinationId ?? this.destinationId,
        sourceValue: sourceValue ?? this.sourceValue,
        destinationValue: destinationValue ?? this.destinationValue,
        errorOccurred: errorOccurred ?? this.errorOccurred,
      );

  @override
  List<Object?> get props => [
        sourceId,
        destinationId,
        sourceValue,
        destinationValue,
        errorOccurred,
      ];
}
