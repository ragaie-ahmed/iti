import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  void register({
    required String emailAddress,
    required String password,
  }) async {
    emit(RegisterLoading());
    try {
      var credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      debugPrint("the id is${credential.user!.uid}");

      uploadDataUserModelIntoCloudStore(
        id: credential.user!.uid,
        email: emailAddress,
        password: password,
      );

      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterError(error: e.toString()));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterError(error: e.toString()));
      }
    } catch (e) {
      emit(RegisterError(error: e.toString()));
    }
  }
  void logIn({
    required String email,
    required String passWord,
  }) async {
    emit(LoadingLogIn());
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: passWord);
      emit(SuccessLogIn());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(ErrorLogIn(error: e.toString()));
      } else if (e.code == 'wrong-password') {
        emit(ErrorLogIn(error: e.toString()));
      }
    } catch (e) {
      emit(ErrorLogIn(error: e.toString()));
    }
  }
  void uploadDataUserModelIntoCloudStore({
    required String email,
    required String password,
    required String id,
  }) async {
    await FirebaseFirestore.instance.collection("users").doc(id).set({
      "email": email,
      "password": password,
      "id": id,
    });
  }
}
