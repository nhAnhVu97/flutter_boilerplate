// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'splash_cubit.dart';

class SplashState extends Equatable {
  const SplashState({this.user, this.errorMessage});

  final UserModel? user;
  final String? errorMessage;

  @override
  List<Object?> get props => [user, errorMessage];

  SplashState copyWith({
    UserModel? user,
    String? errorMessage,
  }) {
    return SplashState(
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  bool get stringify => true;
}
