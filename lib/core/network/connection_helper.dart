import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnectionHelper {
  //Function to check if the device is offline or online

  Future<bool> checkInternetConnection() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      // No available network types
      return false;
    } else if (connectivityResult.any(
      (element) =>
          element == ConnectivityResult.mobile ||
          element == ConnectivityResult.wifi ||
          element == ConnectivityResult.vpn,
    )) {
      return true;
    } else {
      return false;
    }
  }
}
