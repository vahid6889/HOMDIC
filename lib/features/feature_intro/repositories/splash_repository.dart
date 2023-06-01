import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io';

class SplashRepository {
  checkConnectivity() async {
    // try {
    //   final result = await InternetAddress.lookup('example.com');
    //   return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    // } catch (_) {
    //   return false;
    // }

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
