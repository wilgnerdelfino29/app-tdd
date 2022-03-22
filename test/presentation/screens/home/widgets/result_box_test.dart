import 'package:app_tdd/presentation/cubits/home_page_state.dart';
import 'package:app_tdd/presentation/screens/home/widgets/result_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late HomePageState initialState;

  setUp(() {
    initialState = HomePageState.initialState();
  });

  Future<void> buildApp(
    WidgetTester tester, {
    HomePageState? state,
  }) async {
    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: ResultBox(state: state ?? initialState),
      ),
    ));
  }

  testWidgets('should render correctly when error occur',
      (WidgetTester tester) async {
    final state = initialState.copyWith(errorOccurred: true);

    await buildApp(tester, state: state);

    expect(
      find.text('Erro ao fazer a conversão. Tente novamente mais tarde.'),
      findsOneWidget,
    );
  });

  testWidgets('should render correctly when it has a result',
      (WidgetTester tester) async {
    final state = initialState.copyWith(
      sourceId: 'sourceId',
      destinationId: 'destinationId',
      sourceValue: 100,
      destinationValue: 200,
    );

    await buildApp(tester, state: state);

    expect(
      find.text('100,00 sourceId corresponde à 200,00 destinationId'),
      findsOneWidget,
    );
  });

  testWidgets('should render nothing when it has not a result or error',
      (WidgetTester tester) async {
    await buildApp(tester);

    expect(find.byType(SizedBox), findsOneWidget);
    expect(find.byType(Text), findsNothing);
  });
}
