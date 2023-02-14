import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:try_again/LOGIN/bloc/login_main_bloc.dart';
import 'package:try_again/signup/bloc/sign_up_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isVisible = false;
  SignUpBloc signup1 = SignUpBloc();

  final _email = TextEditingController(text: '');
  final _password = TextEditingController(text: '');
  final _lname = TextEditingController(text: "");
  final _fname = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is Signupsuccess) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("success")));
          } else if (state is SignupFailed) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error_msg)));
          }
// TODO: implement listener
        },
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(left: 100, top: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'START FOR FREE',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'Create  new  account.',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.cyan),
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            'Already A Member?',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.cyan),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'sign up',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Card(
                              color: Colors.grey.withOpacity(.4),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: TextField(
                                  controller: _fname,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      labelText: 'First name',
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          Icons.assignment_ind,
                                          color: Colors.grey[300],
                                        ),
                                        onPressed: () {},
                                      ),
                                      labelStyle:
                                          TextStyle(color: Colors.grey[300]),
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: Card(
                              color: Colors.grey.withOpacity(.4),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: TextField(
                                  controller: _lname,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      labelText: 'Last name',
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          Icons.assignment_ind,
                                          color: Colors.grey[300],
                                        ),
                                        onPressed: () {},
                                      ),
                                      labelStyle:
                                          TextStyle(color: Colors.grey[300]),
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Card(
                          color: Colors.grey.withOpacity(.4),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: TextField(
                              controller: _email,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  labelText: 'email',
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.email,
                                      color: Colors.grey[300],
                                    ),
                                    onPressed: () {},
                                  ),
                                  labelStyle:
                                      TextStyle(color: Colors.grey[300]),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.grey.withOpacity(.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: TextField(
                            controller: _password,
                            style: const TextStyle(color: Colors.white),
                            obscureText: isVisible,
                            decoration: InputDecoration(
                                labelText: 'password',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    isVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey[300],
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isVisible = !isVisible;
                                    });
                                  },
                                ),
                                labelStyle: TextStyle(color: Colors.grey[300]),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          // InkWell(
                          //   onTap: () {},
                          //   child: Container(
                          //     height: 50,
                          //     width: 170,
                          //     decoration: BoxDecoration(
                          //       gradient: LinearGradient(
                          //           colors: [
                          //             Colors.grey[600]!,
                          //             Colors.grey[800]!
                          //           ],
                          //           begin: Alignment.topLeft,
                          //           end: Alignment.bottomRight),
                          //       borderRadius: BorderRadius.circular(25),
                          //     ),
                          //     child: const Center(
                          //       child: Text(
                          //         'Change method',
                          //         style: TextStyle(
                          //           color: Colors.white,
                          //           fontSize: 16,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          const SizedBox(width: 20),
                          InkWell(
                            onTap: () {
                              signup1.add(
                                SignUpEventclass(
                                  fname: _fname.text,
                                  lname: _lname.text,
                                  email: _email.text,
                                  password: _password.text,
                                ),
                              );
                            },
                            child: Container(
                              height: 50,
                              width: 170,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    colors: [
                                      Colors.lightBlueAccent,
                                      Colors.cyan
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: const Center(
                                child: Text(
                                  'Create account',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Expanded(flex: 2, child: Card())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
