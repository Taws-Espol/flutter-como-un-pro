part of 'beverage_cubit.dart';

class BeverageState {
  Map<String, List<Beverage>>? beverageItems;
  bool? isLoading;
  String? errorMessage;

  BeverageState({
    this.beverageItems,
    this.isLoading,
    this.errorMessage,
  });

  BeverageState copyWith({
    Map<String, List<Beverage>>? beverageItems,
    bool? isLoading,
    String? errorMessage,
  }) {
    return BeverageState(
      beverageItems: beverageItems ?? this.beverageItems,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
