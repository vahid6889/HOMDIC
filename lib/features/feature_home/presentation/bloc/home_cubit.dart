import 'package:bloc/bloc.dart';
import 'package:homdic/common/resources/data_state.dart';
import 'package:homdic/features/feature_home/data/models/home_model.dart';
import 'package:homdic/features/feature_home/repositories/home_repository.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';
part 'home_data_status.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepository homeRepository;
  HomeCubit(this.homeRepository)
      : super(HomeState(homeDataStatus: HomeDataLoading()));

  void callHomeDataEvent(lat, lon) async {
    emit(state.copyWith(newHomeDataStatus: HomeDataLoading()));

    DataState dataState = await homeRepository.fetchHomeData(lat, lon);

    if (dataState is DataSuccess) {
      /// emit completed
      emit(
          state.copyWith(newHomeDataStatus: HomeDataCompleted(dataState.data)));
    }

    if (dataState is DataFailed) {
      /// emit error
      emit(state.copyWith(newHomeDataStatus: HomeDataError(dataState.error!)));
    }
  }
}
