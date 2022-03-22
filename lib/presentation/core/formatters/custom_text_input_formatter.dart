import 'package:flutter/services.dart';

class CustomTextInputFormatter {
  CustomTextInputFormatter._();

  static FilteringTextInputFormatter decimalWithDotOrComma =
      FilteringTextInputFormatter.allow(RegExp(
          r'^(?:-?(?:[0-9]+))?(?:\.[0-9]*)?(?:,[0-9]*)?(?:[eE][\+\-]?(?:[0-9]+))?$'));
}
