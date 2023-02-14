import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_again/login/bloc/login_bloc.dart';
import 'package:try_again/login/repository/login_repo.dart';

import 'package:try_again/login/widgets/leftSide.dart';
import 'package:try_again/login/widgets/rightSide.dart';
import 'package:try_again/signup/screens/animation_login.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final auth_bloc = LoginBloc();
  final email = TextEditingController(text: '');
  final password = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)),
        elevation: 20.0,
        child: Container(
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
          height: 570,
          width: 1100,
          child: Row(
            children: <Widget>[new LeftSide(), new RightSide()],
          ),
        ),
      ),
    );
  }
}
