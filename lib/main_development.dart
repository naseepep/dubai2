import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:try_again/app/app.dart';
import 'package:try_again/bootstrap.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  
  bootstrap(() => const App());
}
