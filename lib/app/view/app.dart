import 'package:flutter/material.dart';
import 'package:try_again/l10n/l10n.dart';
import 'package:try_again/signup/screens/animation_login.dart';
import 'package:try_again/login/screens/login.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  
  
  Widget build(BuildContext context) {
    return MaterialApp(
    
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: "Lato",
      ),
      home: MyHomePage(title: 'InVision'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          // title: Text(title),
          title: Text('TryAgain'),
        ),
        body: new Login(), 
      );
  }
}
