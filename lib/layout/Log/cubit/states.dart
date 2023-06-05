abstract class LoginState {}

class LoginInitialState extends LoginState {}


class LoginSuccessState extends LoginState {}

class LoginErrorState extends LoginState {
  late String error;
  LoginErrorState(this.error);
}

class LoginLoadingState extends LoginState {}
