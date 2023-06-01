import 'package:dio/dio.dart';
import 'package:homdic/common/error_handling/check_exceptions.dart';
import 'package:homdic/common/params/products_params.dart';
import 'package:homdic/config/constantse.dart';

class ProductApiProvider {
  Dio dio;
  ProductApiProvider(this.dio);

  dynamic callAllProducts(ProductsParams productsParams) async {
    try {
      final response = await dio.post(
        "${Constants.baseUrl}/products",
        data: {
          "start": productsParams.start,
          "step": productsParams.step,
          "categories": productsParams.categories,
          "maxPrice": productsParams.maxPrice,
          "minPrice": productsParams.minPrice,
          "sortby": productsParams.sortBy,
          'search': productsParams.search
        },
      );

      return response;
    } on DioError catch (e) {
      return CheckExceptions.response(e.response!);
    }
  }
}
