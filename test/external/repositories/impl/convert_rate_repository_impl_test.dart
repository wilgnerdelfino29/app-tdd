import 'package:app_tdd/external/repositories/impl/convert_rate_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import './convert_rate_repository_impl_test.mocks.dart';

@GenerateMocks([HiveInterface, Box])
void main() {
  late MockBox mockBox;
  late MockHiveInterface mockHive;
  late ConvertRateRepositoryImpl repository;

  setUp(() {
    mockBox = MockBox();
    mockHive = MockHiveInterface();
    repository = ConvertRateRepositoryImpl(mockHive);

    when(mockHive.box('convertRates')).thenReturn(mockBox);
  });

  test("should call the hive box correctly", () async {
    //given
    when(mockBox.get('sourceId_destinationId')).thenReturn(0.0);

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
    when(mockBox.get('sourceId_destinationId')).thenReturn(5.0);

    //when
    final result = repository.getConvertRate(
      sourceId: 'sourceId',
      destinationId: 'destinationId',
    );

    //then
    expect(result, 5.0);
  });

  test("should throw a Exception if convertRate is null", () async {
    //given
    when(mockBox.get('sourceId_destinationId')).thenReturn(null);

    //then
    expect(
      () => repository.getConvertRate(
        sourceId: 'sourceId',
        destinationId: 'destinationId',
      ),
      throwsA(isA<Exception>()),
    );
  });
}
