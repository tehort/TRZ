import 'package:dio/dio.dart';
import 'package:trz/core/dependency_injection/dependency_injection.dart';
import 'package:trz/core/errors/error_handler.dart';
import 'package:trz/core/network/validate_connection.dart';

class DioClient {
  final _dio = inject<Dio>();

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async {
    try {
      await validateConnection();
      final response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on DioError catch (e) {
      return Future.error(ErrorHandler.translateDioError(e));
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    try {
      await validateConnection();

      final response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioError catch (e) {
      return Future.error(ErrorHandler.translateDioError(e));
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> patch(
    String uri, {
    data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    try {
      await validateConnection();

      final response = await _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioError catch (e) {
      return Future.error(ErrorHandler.translateDioError(e));
    } catch (e) {
      return Future.error(e);
    }
  }
}
