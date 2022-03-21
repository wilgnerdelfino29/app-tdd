import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import '../business/repositories/convert_rate_repository.dart';
import '../business/usecases/convert_currency.dart';
import '../business/usecases/impl/convert_currency_impl.dart';
import '../external/repositories/impl/convert_rate_repository_impl.dart';
import '../presentation/cubits/home_page_cubit.dart';

final getIt = GetIt.instance;

Future<void> configInjection() async {
  getIt.allowReassignment = true;
  //External
  getIt.registerLazySingleton<ConvertRateRepository>(
      () => ConvertRateRepositoryImpl(Hive));
  //Business
  getIt.registerLazySingleton<ConvertCurrency>(
      () => ConvertCurrencyImpl(getIt()));
  //Presentation
  getIt.registerFactory<HomePageCubit>(() => HomePageCubit(getIt()));

  await getIt.allReady();
}
