import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import './convert_currency_test.mocks.dart';

@GenerateMocks([ConvertRateRepository])
void main() {
  final mockRepository = MockConvertRateRepository();
  final usecase = ConvertCurrency(mockRepository);
  final convertion = Convertion(
    sourceId: 'any_source',
    destinationId: 'any_destination',
    sourceValue: 2.00,
  );
  const convertRate = 5.00;
  test('should call the ConvertRateRepository correctly', () {
    when(mockRepository.getConvertRate(
      sourceId: convertion.sourceId,
      destinationId: convertion.destinationId,
    )).thenAnswer((realInvocation) => convertRate);

    usecase(convertion);

    verify(mockRepository.getConvertRate(
      sourceId: convertion.sourceId,
      destinationId: convertion.destinationId,
    ));
  });
}

class Convertion {
  final String sourceId;
  final String destinationId;
  final double sourceValue;

  Convertion({
    required this.sourceId,
    required this.destinationId,
    required this.sourceValue,
  });
}

abstract class ConvertRateRepository {
  double getConvertRate({
    required String sourceId,
    required String destinationId,
  });
}

class ConvertCurrency {
  final ConvertRateRepository _convertRateRepository;

  ConvertCurrency(this._convertRateRepository);

  double call(Convertion convertion) {
    final convertRate = _convertRateRepository.getConvertRate(
      sourceId: convertion.sourceId,
      destinationId: convertion.destinationId,
    );
    return convertion.sourceValue * convertRate;
  }
}
