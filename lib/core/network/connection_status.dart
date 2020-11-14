import 'dart:async';
import 'package:connectivity/connectivity.dart';

class ConnectionStatus {
  static ConnectivityResult networkStatus;
  static StreamSubscription<ConnectivityResult> subscription;

  void cancelSubscription() {
    subscription?.cancel();
  }

  Future subscribeConnectionChange() async {
    ConnectionStatus.subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        ConnectionStatus.networkStatus = result;
      },
    );

    ConnectionStatus.networkStatus = await Connectivity().checkConnectivity();
  }
}
