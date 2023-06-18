import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:homdic/common/utils/prefs_operator.dart';
import 'package:homdic/features/feature_auth/data/data_source/auth_api_provider.dart';
import 'package:homdic/features/feature_auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:homdic/features/feature_auth/presentation/bloc/signup_bloc/signup_bloc.dart';
import 'package:homdic/features/feature_auth/repositories/auth_repository.dart';
import 'package:homdic/features/feature_home/data/data_source/home_api_provider.dart';
import 'package:homdic/features/feature_home/repositories/home_repository.dart';
import 'package:homdic/features/feature_product/data/data_source/category_api_provider.dart';
import 'package:homdic/features/feature_product/data/data_source/product_api_provider.dart';
import 'package:homdic/features/feature_product/repository/all_products_repository.dart';
import 'package:homdic/features/feature_product/repository/category_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

Future<void> initLocator() async {
  locator.registerSingleton<Dio>(Dio());

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);
  locator.registerSingleton<PrefsOperator>(PrefsOperator());

  /// api provider
  locator.registerSingleton<HomeApiProvider>(HomeApiProvider(locator()));
  locator
      .registerSingleton<CategoryApiProvider>(CategoryApiProvider(locator()));
  locator.registerSingleton<ProductApiProvider>(ProductApiProvider(locator()));
  locator.registerSingleton<AuthApiProvider>(AuthApiProvider(locator<Dio>()));

  /// repositories
  locator.registerSingleton<HomeRepository>(HomeRepository(locator()));
  locator.registerSingleton<CategoryRepository>(CategoryRepository(locator()));
  locator.registerSingleton<AllProductsRepository>(
      AllProductsRepository(locator()));
  locator.registerSingleton<AuthRepository>(
      AuthRepository(locator<AuthApiProvider>()));

  /// bloc
  locator.registerSingleton<SignupBloc>(SignupBloc(locator<AuthRepository>()));
  locator.registerSingleton<LoginBloc>(LoginBloc(locator<AuthRepository>()));
}
