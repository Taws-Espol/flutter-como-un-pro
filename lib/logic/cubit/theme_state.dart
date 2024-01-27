part of 'theme_cubit.dart';

class ThemeState {
  ThemeData? themeData;

  ThemeState({
    this.themeData,
  });

  ThemeState copyWith({
    ThemeData? themeData,
  }) {
    return ThemeState(
      themeData: themeData ?? this.themeData,
    );
  }
}
