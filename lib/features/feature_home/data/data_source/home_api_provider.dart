import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:homdic/common/error_handling/check_exceptions.dart';
import 'package:homdic/config/constantse.dart';

class HomeApiProvider {
  Dio dio;
  HomeApiProvider(this.dio);

  dynamic callHomeData(lat, lon) async {
    final response = await dio.get(
      "${Constants.baseUrl}/mainData",
      queryParameters: {
        "lat": lat,
        "long": lon,
      },
    ).onError((DioError error, stackTrace) {
      return CheckExceptions.response(error.response!);
    });

    log(response.toString());

    return response;
  }
}
