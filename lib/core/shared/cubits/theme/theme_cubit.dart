import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_boilerplate/core/data/locals/hive_storage.dart';
import 'package:flutter_project_boilerplate/core/shared/themes/themes.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(theme: AppTheme.light));

  Future<void> loadTheme() async {
    final savedTheme = await HiveStorage.getByKey(HiveStorage.theme, AppTheme.light.name);
    final theme = AppTheme.values.firstWhere((element) => element.name == savedTheme);
    emit(state.copyWith(theme: theme));
  }

  void setTheme(AppTheme theme) {
    emit(state.copyWith(theme: theme));
    HiveStorage.setByKey(HiveStorage.theme, theme.name);
  }

  ThemeData getTheme() {
    final theme = state.theme;
    switch (theme) {
      case AppTheme.light:
        return Themes.lightTheme;
      case AppTheme.dark:
        return Themes.darkTheme;
    }
  }
}
