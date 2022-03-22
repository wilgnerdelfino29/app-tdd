import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection/config_injection.dart';
import '../../cubits/home_page_cubit.dart';
import 'widgets/destination_currency_row.dart';
import 'widgets/result_box.dart';
import 'widgets/source_currency_row.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String sourceDropdownValue = 'Real';
  String destinationDropdownValue = 'US Dolar';
  TextEditingController sourceValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: BlocProvider<HomePageCubit>(
        create: (context) => getIt<HomePageCubit>(),
        child: Builder(
          builder: (context) {
            final homePageCubit = context.watch<HomePageCubit>();
            final state = homePageCubit.state;
            final currencyNames = state.availableCurrencies
                .map((currency) => currency.name)
                .toList();

            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SourceCurrencyRow(
                      dropdownValue: sourceDropdownValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          if (newValue == destinationDropdownValue) {
                            destinationDropdownValue = sourceDropdownValue;
                          }
                          sourceDropdownValue = newValue!;
                        });
                      },
                      currencies: currencyNames,
                      sourceValueController: sourceValueController,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    DestinationCurrencyRow(
                      dropdownValue: destinationDropdownValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          if (newValue == sourceDropdownValue) {
                            sourceDropdownValue = destinationDropdownValue;
                          }
                          destinationDropdownValue = newValue!;
                        });
                      },
                      currencies: currencyNames,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: 120,
                      child: TextButton(
                        onPressed: () {
                          final sourceValue = sourceValueController.text;
                          if (sourceValue.isNotEmpty) {
                            homePageCubit.convertValue(
                              sourceName: sourceDropdownValue,
                              destinationName: destinationDropdownValue,
                              sourceValue: double.parse(sourceValue),
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blue,
                          ),
                        ),
                        child: const Text(
                          'Converter',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ResultBox(
                      state: state,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
