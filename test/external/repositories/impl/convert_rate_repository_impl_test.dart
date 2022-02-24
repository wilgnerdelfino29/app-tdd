import 'package:app_tdd/business/repositories/convert_rate_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import './convert_rate_repository_impl_test.mocks.dart';

@GenerateMocks([HiveInterface, Box])
void main() {
  final mockBox = MockBox();
  final mockHive = MockHiveInterface();
  final repository = ConvertRateRepositoryImpl(mockHive);
  test("should call the hive box correctly", () async {
    //given
    when(mockHive.box('convertRates')).thenReturn(mockBox);

    //when
    repository.getConvertRate(
      sourceId: 'sourceId',
      destinationId: 'destinationId',
    );

    //then
    verify(mockHive.box('convertRates'));
  });

  test("should get the value from the convertRates box correctly", () async {
    //given
    when(mockHive.box('convertRates')).thenReturn(mockBox);
    when(mockBox.get('sourceId_destinationId')).thenReturn(0.0);

    //when
    repository.getConvertRate(
      sourceId: 'sourceId',
      destinationId: 'destinationId',
    );

    //then
    verify(mockBox.get('sourceId_destinationId'));
  });

  test("should return the convertRate correctly", () async {
    //given
    when(mockHive.box('convertRates')).thenReturn(mockBox);
    when(mockBox.get('sourceId_destinationId')).thenReturn(5.0);

    //when
    final result = repository.getConvertRate(
      sourceId: 'sourceId',
      destinationId: 'destinationId',
    );

    //then
    expect(result, 5.0);
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
    final box = hive.box('convertRates');
    final convertRate = box.get([sourceId, destinationId].join('_'));
    return convertRate as double;
  }
}
