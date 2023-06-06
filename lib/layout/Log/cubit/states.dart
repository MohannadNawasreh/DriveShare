import '../../../models/TokenModel.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}


class LoginSuccessState extends LoginState {}

class LoginErrorState extends LoginState {
  late String error;
  LoginErrorState(this.error);
}

class LoginLoadingState extends LoginState {}



abstract class DSLoginState {}

class DSLoginIntialState extends DSLoginState {}

class DSLoginLoadingState extends DSLoginState {}

class DSLoginSuccessState extends DSLoginState {
  final TokenModel T;
  DSLoginSuccessState(this.T);
}

class DSLoginErrorState extends DSLoginState {
  final String error;

  DSLoginErrorState(this.error);
}