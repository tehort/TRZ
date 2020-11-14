import 'package:dio/dio.dart';
import 'package:dio_retry/dio_retry.dart';
import 'package:get_it/get_it.dart';
import 'package:trz/core/network/dio_client.dart';
import 'package:trz/core/network/network_constants.dart';
import 'package:trz/models/session.dart';
import 'package:trz/services/user_data.service.dart';
import 'package:trz/ui/pages/contacts/contacts.viewmodel.dart';
import 'package:trz/ui/pages/explore/explore.viewmodel.dart';
import 'package:trz/ui/pages/home/home.viewmodel.dart';
import 'package:trz/ui/pages/login/login.viewmodel.dart';

final GetIt inject = GetIt.I;

void init() {
  inject.allowReassignment = true;
  inject.registerSingleton<LoginViewModel>(LoginViewModel());
  inject.registerSingleton<ExploreViewModel>(ExploreViewModel());
  inject.registerSingleton<UserDataService>(UserDataService());
  inject.registerSingleton<ContactsViewModel>(ContactsViewModel());
  inject.registerSingleton<Session>(Session());
  inject.registerSingleton<HomeViewModel>(HomeViewModel());

  inject.registerFactory<Dio>(
    () {
      final dio = Dio(
        BaseOptions(
          baseUrl: NetworkConstants.baseUrl,
          connectTimeout: NetworkConstants.connectTimeout,
          receiveTimeout: NetworkConstants.receiveTimeout,
          sendTimeout: NetworkConstants.sendTimeout,
        ),
      );
      dio.interceptors.add(
        RetryInterceptor(
          dio: dio,
          options: const RetryOptions(
            retries: 3,
            retryInterval: Duration(seconds: 1),
          ),
        ),
      );

      return dio;
    },
  );

  inject.registerFactory(() => DioClient());
}
