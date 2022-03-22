import 'package:intl/intl.dart';

extension DoubleExtension on double {
  String formatAmount() {
    return NumberFormat('#,##0.00', 'pt_BR').format(this);
  }
}
