import 'package:flutter/material.dart';

import '../../../core/extensions/double_extension.dart';
import '../../../cubits/home_page_state.dart';

class ResultBox extends StatelessWidget {
  final HomePageState state;

  const ResultBox({
    Key? key,
    required this.state,
  }) : super(key: key);

  String formatResult() {
    final sourceValue = state.sourceValue.formatAmount();
    final destinationValue = state.destinationValue.formatAmount();
    return '$sourceValue ${state.sourceId} corresponde à $destinationValue ${state.destinationId}';
  }

  @override
  Widget build(BuildContext context) {
    if (state.errorOccurred) {
      return const SizedBox(
        width: 280,
        child: Text(
          'Erro ao fazer a conversão. Tente novamente mais tarde.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.red,
          ),
        ),
      );
    }

    if (state.destinationValue > 0.0) {
      return SizedBox(
        child: Text(
          formatResult(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      );
    }

    return const SizedBox();
  }
}
