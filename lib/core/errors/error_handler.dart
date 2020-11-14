import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:trz/core/errors/exceptions.dart';
import 'package:trz/core/helpers/dialogs.dart';
import 'package:trz/core/network/connection_status.dart';

class ErrorHandler {
  static Future handleError(e, BuildContext context) async {
    print('Error: ${e.toString()}');

    if (e is NoInternetAvailableException) {
      await _handleError(context, e);
    } else if (e is DioError) {
      await _handleDioError(context, e);
    } else if (e is Failure) {
      await _handleError(context, e);
    } else if (e is Failure) {
      await _handleError(context, e);
    } else {
      await showErrorDialog(context, 'Erro no aplicativo.');
    }
  }

  static Future _handleError(BuildContext context, e) async {
    await showErrorDialog(context, e.message);
    print(e.toString());
  }

  static Future _handleDioError(BuildContext context, DioError e) async {
    if (e.response?.statusCode == 400) {
      await showErrorDialog(context, e.response.statusMessage);
    } else {
      await showErrorDialog(context, 'Erro de conexão.');
    }

    print(e.toString());
  }

  static Failure translateDioError(e) {
    print('Error: ${e.toString()}');

    final errorDescription = _getDioErrorString(e);
    return Failure(errorDescription);
  }

  static String _getDioErrorString(e) {
    var errorDescription = '';

    if (ConnectionStatus.networkStatus == ConnectivityResult.none) {
      errorDescription = 'Verifique sua conexão com a internet';
    } else if (e is DioError) {
      switch (e.type) {
        case DioErrorType.CANCEL:
          errorDescription =
              'Erro de API: A solicitação para o servidor de API foi cancelada';
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription =
              'Erro de API: Tempo limite de conexão com o servidor de API';
          break;
        case DioErrorType.DEFAULT:
          errorDescription =
              'Erro de API: Falha na conexão com o servidor de API';
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription =
              'Erro de API: Tempo limite de recebimento com o servidor de API';
          break;
        case DioErrorType.RESPONSE:
          // 'Erro de API: Código de status inválido recebido: ${e.response.statusCode}';
          errorDescription = e.response.statusMessage;
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorDescription =
              'Erro de API: Tempo limite de envio com o servidor de API';
          break;
      }
    } else if (e is FormatException) {
      errorDescription = 'Erro de API: Formato de resposta inesperado';
    } else {
      errorDescription = 'Erro de API: Erro inesperado';
    }

    return errorDescription;
  }
}
