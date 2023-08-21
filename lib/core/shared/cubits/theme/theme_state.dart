// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_cubit.dart';

enum AppTheme {
  light,
  dark,
}

class ThemeState extends Equatable {
  const ThemeState({
    required this.theme,
  });

  final AppTheme theme;

  @override
  List<Object?> get props => [theme];

  ThemeState copyWith({
    AppTheme? theme,
  }) {
    return ThemeState(
      theme: theme ?? this.theme,
    );
  }
}
