import 'package:dio/dio.dart';
import 'package:homdic/common/error_handling/app_exception.dart';
import 'package:homdic/common/error_handling/check_exceptions.dart';
import 'package:homdic/common/resources/data_state.dart';
import 'package:homdic/features/feature_home/data/data_source/home_api_provider.dart';
import 'package:homdic/features/feature_home/data/models/home_model.dart';

class HomeRepository {
  HomeApiProvider apiProvider;

  HomeRepository(this.apiProvider);

  Future<DataState<HomeModel>> fetchHomeData(lat, lon) async {
    try {
      Response response = await apiProvider.callHomeData(lat, lon);
      final HomeModel homeModel = HomeModel.fromJson(response.data);
      return DataSuccess(homeModel);
    } on AppException catch (e) {
      return await CheckExceptions.getError(e);
    }
  }
}
