part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class Signupsuccess extends SignUpState {}

class SignupFailed extends SignUpState {
  String error_msg;

  SignupFailed({required this.error_msg});
}
