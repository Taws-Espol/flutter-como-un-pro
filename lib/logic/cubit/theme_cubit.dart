import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_como_un_pro/core/services/shared_preferences/configuracion_storage.dart';
import 'package:flutter_como_un_pro/core/theme/dark_theme.dart';
import 'package:flutter_como_un_pro/core/theme/light_theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(ThemeState(
            themeData: ConfiguracionStorage.isDarkMode
                ? DarkTheme().theme
                : LightTheme().theme));
  void setLightTheme() {
    emit(state.copyWith(themeData: LightTheme().theme));
  }

  void setDarkTheme() {
    emit(state.copyWith(themeData: DarkTheme().theme));
  }
}
