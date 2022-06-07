import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(( (FirebaseAuth.instance.currentUser == null) ? AuthInitial() : AuthSuccess(FirebaseAuth.instance.currentUser!.uid))) {
    on<AuthCreate>(_handleAuthCreate);
    on<AuthLogin>(_handleAuthLogin);
    on<AuthPageLoad>(_handleAuthInitial);
  }

  void _handleAuthInitial(AuthPageLoad event, Emitter<AuthState> emit) {
    print("AUTH INITIAL HANDLED");
    if (FirebaseAuth.instance.currentUser != null) {
      emit(AuthSuccess(FirebaseAuth.instance.currentUser!.uid));
    }
  }

  void _handleAuthCreate(AuthCreate event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    if (event.password != event.confirmPassword) {
      emit(AuthFailure(errorMessage: "Passwords aren't identical."));
    } else {
      String username = event.username;
      String password = event.password;
      try {
        print("in 'Handle Auth Create', with $username and $password");
        await authRepository.createUser(username, password);
        emit(AuthSuccess(username));
      } catch (_) {
        emit(AuthFailure());
      }
    }
  }

  void _handleAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    String username = event.username;
    String password = event.password;
    try {
      await authRepository.authenticateUser(username, password);
      emit(AuthSuccess(username));
    } catch (_) {
      emit(AuthFailure(errorMessage: _.toString()));
    }
  }
}


  // AuthBloc({required this.authRepository}) : super(AuthInitial()) {
  //   on<AuthCreate>((event, emit) {
  //   });

//      on<AuthCreate>((event, emit) async {
//     emit(AuthLoading());
//     try {
//       await authRepository.createUser(event.username, event.password);
//       emit(AuthSuccess(event.username));
//     } catch (e) {
//       emit(AuthFailure());
//     }
// });



    // yield AuthLoading();
    // String username = event.username;
    // String password = event.password;
    // try {
    //   if (event is AuthCreate) {
    //     await authRepository.createUser(username, password);
    //   } else if (event is AuthLogin) {
    //     await authRepository.authenticateUser(username, password);
    //   }
    //   yield AuthSuccess(username);
    // } catch (_) {
    //   yield AuthFailure();
    // }

