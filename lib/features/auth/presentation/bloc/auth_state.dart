part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final AuthStatus status;
  final bool isLogin;
  const AuthState({
    this.status = AuthStatus.unauthenticated,
    this.isLogin = false,
  });

  AuthState copyWith({
    AuthStatus? status,
    bool? isLogin,
  }) {
    return AuthState(
      status: status ?? this.status,
      isLogin: isLogin ?? this.isLogin,
    );
  }

  @override
  List<Object> get props => [status, isLogin];
}
