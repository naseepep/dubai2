part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginSuccess extends LoginState {}

class LoginFailed extends LoginState {

  String error_msg;
  LoginFailed({required this.error_msg});

}
