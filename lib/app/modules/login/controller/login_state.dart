part of 'login_controller.dart';

enum LoginStatusEnum { initial, loading, failure }

class LoginState extends Equatable {
  final LoginStatusEnum status;
  final String? errorMessage;

  const LoginState._({required this.status, this.errorMessage});

  const LoginState.initial() : this._(status: LoginStatusEnum.initial);

  @override
  List<Object?> get props => [status, errorMessage];

  LoginState copyWith({
    LoginStatusEnum? status,
    String? errorMessage,
  }) {
    return LoginState._(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
