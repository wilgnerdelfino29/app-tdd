import 'package:hive/hive.dart';

import '../../../business/repositories/convert_rate_repository.dart';

class ConvertRateRepositoryImpl extends ConvertRateRepository {
  final HiveInterface hive;

  ConvertRateRepositoryImpl(this.hive);

  @override
  double getConvertRate({
    required String sourceId,
    required String destinationId,
  }) {
    final box = hive.box('convertRates');
    final convertRate = box.get([sourceId, destinationId].join('_'));
    if (convertRate == null) {
      throw Exception();
    }
    return convertRate as double;
  }
}
