import 'package:dio/dio.dart';
import 'package:expensetracker/core/config/env.dart';
import 'package:expensetracker/core/http/api_provider.dart';
import 'package:expensetracker/core/http/token_handler.dart';
import 'package:expensetracker/core/network/network_info.dart';
import 'package:expensetracker/core/storage/local_storage.dart';
import 'package:expensetracker/core/storage/secure_storage.dart';
import 'package:expensetracker/core/usecase/all_pagination.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

final serviceLocator = GetIt.instance;

Future<void> init(
  Env env,
) async {
  serviceLocator.registerFactory<Env>(() => env);
  serviceLocator
      .registerLazySingleton<InternetConnection>(() => InternetConnection());
  serviceLocator
      .registerLazySingleton<PaginationHandler>(() => PaginationHandler());
  serviceLocator.registerLazySingleton<NetWorkInfo>(
      () => NetWorkInfoImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<ApiProvider>(() => ApiProvider(
        env: serviceLocator(),
        localStorage: serviceLocator(),
      ));
  serviceLocator.registerLazySingleton<Dio>(() => Dio());
  serviceLocator.registerLazySingleton<LocalStorage>(() => SecureStorage());
  serviceLocator.registerLazySingleton(
    () => DioClient(
      localStorage: serviceLocator(),
      baseUrl: serviceLocator(),
      userId: serviceLocator(),
      apiKey: serviceLocator(),
    ),
  );
}
