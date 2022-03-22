import 'package:app_tdd/presentation/core/extensions/double_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("should format amount when it has less decimals", () {
    const amount = 2.0;
    expect(amount.formatAmount(), '2,00');
  });

  test("should format amount when it has more decimals", () {
    const amount = 5.00000;
    expect(amount.formatAmount(), '5,00');
  });

  test("should format amount when it is negative", () {
    const amount = -10.0;
    expect(amount.formatAmount(), '-10,00');
  });
}
