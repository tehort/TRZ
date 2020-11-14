import 'package:connectivity/connectivity.dart';
import 'package:trz/core/errors/exceptions.dart';

Future validateConnection() async {
  if (await Connectivity().checkConnectivity() == ConnectivityResult.none) {
    return Future.error(NoInternetAvailableException());
  }
}
