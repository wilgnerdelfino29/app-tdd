import '../entities/convertion.dart';
import '../repositories/convert_rate_repository.dart';
import '../usecases/convert_currency.dart';

class ConvertCurrencyImpl extends ConvertCurrency {
  final ConvertRateRepository _convertRateRepository;

  ConvertCurrencyImpl(this._convertRateRepository);

  @override
  double call(Convertion convertion) {
    final convertRate = _convertRateRepository.getConvertRate(
      sourceId: convertion.sourceId,
      destinationId: convertion.destinationId,
    );
    return convertion.sourceValue * convertRate;
  }
}
