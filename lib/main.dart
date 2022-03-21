import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'injection/config_injection.dart';
import 'presentation/screens/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configHive();
  await configInjection();
  runApp(const MyApp());
}

Future<void> configHive() async {
  await Hive.initFlutter();
  final box = await Hive.openBox('convertRates');
  box.putAll({
    'BRL_BRL': 1.00,
    'BRL_USD': 0.1926,
    'BRL_EUR': 0.1676,
    'USD_BRL': 5.1932,
    'USD_USD': 1.00,
    'USD_EUR': 0.8704,
    'EUR_BRL': 5.9654,
    'EUR_USD': 1.1488,
    'EUR_EUR': 1.00,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de moedas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
