import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      if (event is SignUpEventclass) {
        final _auth = FirebaseAuth.instance;
        final userRef = FirebaseFirestore.instance.collection('studentDetails');

        try {
          await _auth.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );

          await userRef.doc('123').set({
            'user_id': 123,
            'first_name': 'fname',
            'last_name': 'sname',
            'email': 'email',
            'password': 'password',
            'profile_picture': '',
          });

          emit(Signupsuccess());
        } on FirebaseAuthException catch (e) {
          print(e.code);
          print(e);
          emit(SignupFailed(error_msg: e.code));
        }
      }
    });
  }
}
