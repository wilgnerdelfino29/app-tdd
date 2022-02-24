import 'package:app_tdd/business/repositories/convert_rate_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import './convert_rate_repository_impl_test.mocks.dart';

@GenerateMocks([HiveInterface])
void main() {
  final mockHive = MockHiveInterface();
  final repository = ConvertRateRepositoryImpl(mockHive);
  test("should call the hive box correctly", () async {
    //given
    await Hive.initFlutter();
    final box = await Hive.openBox('test');
    when(mockHive.box('convertRates')).thenReturn(box);

    //when
    repository.getConvertRate(
      sourceId: 'sourceId',
      destinationId: 'destinationId',
    );

    //then
    verify(mockHive.box('convertRates'));
  });
}

class ConvertRateRepositoryImpl extends ConvertRateRepository {
  final HiveInterface hive;

  ConvertRateRepositoryImpl(this.hive);

  @override
  double getConvertRate({
    required String sourceId,
    required String destinationId,
  }) {
    hive.box('convertRates');
    return 0.0;
  }
}
