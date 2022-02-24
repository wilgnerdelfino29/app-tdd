import 'package:app_tdd/business/repositories/convert_rate_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final repository = ConvertRateRepositoryImpl();
  test("should call the hive box correctly", () {
    //given

    //when
    repository.getConvertRate(
      sourceId: 'sourceId',
      destinationId: 'destinationId',
    );

    //then
  });
}

class ConvertRateRepositoryImpl extends ConvertRateRepository {
  @override
  double getConvertRate({
    required String sourceId,
    required String destinationId,
  }) {
    // TODO: implement getConvertRate
    throw UnimplementedError();
  }
}
