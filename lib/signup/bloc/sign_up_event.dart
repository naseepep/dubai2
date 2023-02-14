part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpEventclass extends SignUpEvent {
  String fname;
  String lname;
  String email;
  String password;

  SignUpEventclass(
      {required this.fname,
      required this.lname,
      required this.email,
      required this.password});
}
