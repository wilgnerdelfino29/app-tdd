// Mocks generated by Mockito 5.1.0 from annotations
// in app_tdd_exemplo/test/convert_currency_test.dart.
// Do not manually edit this file.

import 'package:mockito/mockito.dart' as _i1;

import 'convert_currency_test.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [ConvertRateRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockConvertRateRepository extends _i1.Mock
    implements _i2.ConvertRateRepository {
  MockConvertRateRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  double getConvertRate({String? sourceId, String? destinationId}) =>
      (super.noSuchMethod(
          Invocation.method(#getConvertRate, [],
              {#sourceId: sourceId, #destinationId: destinationId}),
          returnValue: 0.0) as double);
}
