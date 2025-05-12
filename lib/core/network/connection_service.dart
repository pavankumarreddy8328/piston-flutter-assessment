import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:zpay/core/utils/logger.dart';

class ConnectivityService {
  final _controller = StreamController<bool>.broadcast();
  final _connectivity = Connectivity();

  ConnectivityService() {
    logger.i("Connectivity is Called");
    _connectivity.onConnectivityChanged.listen((result) {
      final isConnected = result.any(
         (element) =>
          element == ConnectivityResult.mobile ||
          element == ConnectivityResult.wifi ||
          element == ConnectivityResult.vpn,
      );
      _controller.sink.add(isConnected);
    });
  }

  Stream<bool> get connectivityStream => _controller.stream;

  void dispose() {
    _controller.close();
  }
}
