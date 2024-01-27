import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_como_un_pro/data/models/models.dart';
import 'package:flutter_como_un_pro/data/repository/beverage_repository.dart';

part 'beverage_state.dart';

class BeverageCubit extends Cubit<BeverageState> {
  final BeverageRepository _beverageRepository;

  BeverageCubit()
      : _beverageRepository = BeverageRepository(), // 1
        super(BeverageState());

  Future<void> getCompleteBeverageList() async {
    emit(state.copyWith(isLoading: true));
    try {
      final res = await _beverageRepository.getCompleteBeverageList();
      emit(state.copyWith(beverageItems: res, isLoading: false));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
    }
  }
}
