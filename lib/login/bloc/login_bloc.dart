import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<StLoginEvent>((event, emit) async{
      // TODO: implement event handler
        // print(event.email);
        // print(event.password);
        // print(event);
         final FirebaseAuth auth = FirebaseAuth.instance;
        try {
          await auth.signInWithEmailAndPassword(
              email: event.email, password: event.password);
          emit(LoginSuccess());

        } on FirebaseAuthException catch (e) {
          // print('000000000000000000000000000000000000000000');
          // print(e.code);
          emit(LoginFailed(error_msg: e.code));
        }
      }
    );
    }
  }

