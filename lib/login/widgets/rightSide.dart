import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:try_again/login/bloc/login_bloc.dart';
import 'package:try_again/login/repository/login_repo.dart';
import 'package:try_again/signup/screens/animation_login.dart';

class RightSide extends StatefulWidget {
  const RightSide({
    Key? key,
  }) : super(key: key);

  @override
  State<RightSide> createState() => _RightSideState();
}

class _RightSideState extends State<RightSide> {
  final auth_bloc = LoginBloc();
  TextEditingController _email = TextEditingController(),
      _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          // TODO: implement listener
          () async {
            try {
              await LoginRepo().loginSt(_email.text, _password.text);

              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpPage(),
                ),
              );
            } catch (e) {
              print('---------------------------------------');
              print(e);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('invalid email or password'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          };
        },
        child: Flexible(
          flex: 3,
          child: Container(
            color: Colors.white,
            child: Container(
              padding: EdgeInsets.all(50),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign into ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            letterSpacing: 1),
                      ),
                      Text(
                        'TryAgain',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.cyan,
                            letterSpacing: 2),
                      ),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        'Enter your details below',
                        style: TextStyle(color: Colors.grey),
                      )),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    width: 400,
                    child: TextField(
                      controller: _email,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        hintText: '',
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.grey)),
                        enabledBorder: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.grey)),
                      ),
                    ),
                  ),
                  Container(
                    width: 400,
                    child: TextField(
                      controller: _password,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.grey)),
                        enabledBorder: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.grey)),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 30),
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          // ignore: prefer_const_constructors
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.cyan),

                          // padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                          onPressed: () {
                            auth_bloc.add(StLoginEvent(
                                email: _email.text, password: _password.text));
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          //color: Colors.cyan,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.cyan),
                          onPressed: () {},
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 30),
                      padding: EdgeInsets.only(top: 20),
                      width: 300,
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                        color: Colors.grey,
                      ))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(Icons.facebook),

                          SizedBox(
                            width: 20,
                          ),
                          // Icon(FontAwesomeIcons.barcode),
                          //Icon(Icons.yo)

                          SizedBox(
                            width: 20,
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
