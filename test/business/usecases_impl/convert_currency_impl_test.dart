import 'package:app_tdd/business/entities/convertion.dart';
import 'package:app_tdd/business/repositories/convert_rate_repository.dart';
import 'package:app_tdd/business/usecases/convert_currency.dart';
import 'package:app_tdd/business/usecases_impl/convert_currency_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import './convert_currency_test.mocks.dart';

@GenerateMocks([ConvertRateRepository])
void main() {
  late MockConvertRateRepository mockRepository;
  late ConvertCurrency usecase;
  late Convertion convertion;

  const convertRate = 5.00;

  setUp(() {
    mockRepository = MockConvertRateRepository();
    usecase = ConvertCurrencyImpl(mockRepository);
    convertion = Convertion(
        sourceId: 'any_source',
        destinationId: 'any_destination',
        sourceValue: 2.00);
  });

  group('call', () {
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

    test('should return the converted value correctly', () {
      when(mockRepository.getConvertRate(
        sourceId: convertion.sourceId,
        destinationId: convertion.destinationId,
      )).thenAnswer((realInvocation) => convertRate);

      final result = usecase(convertion);

      expect(result, convertRate * convertion.sourceValue);
    });

    test('should not handle any exception', () {
      when(mockRepository.getConvertRate(
        sourceId: convertion.sourceId,
        destinationId: convertion.destinationId,
      )).thenThrow(Exception());

      expect(() => usecase(convertion), throwsA(isA<Exception>()));
    });
  });
}
