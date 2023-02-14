part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}
class StLoginEvent  extends LoginEvent{
  String email;
  String password;

  StLoginEvent({required this.email, required this.password});
}
