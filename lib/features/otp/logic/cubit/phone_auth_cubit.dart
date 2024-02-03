// ignore_for_file: unnecessary_this

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_and_google_maps/features/otp/logic/cubit/phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  late String verificationId;
  late String otpCode;
  PhoneAuthCubit() : super(const PhoneAuthState.initial());

  final phoneFormKey = GlobalKey<FormState>();
  TextEditingController phoneNumber = TextEditingController();

  Future<void> submitPhoneNumber() async {
    emit(const PhoneAuthState.loading());
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+967${phoneNumber.text}',
      timeout: const Duration(seconds: 14),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }


  void verificationCompleted(PhoneAuthCredential phoneAuthCredential) async {
    print('verificationCompleted');
    await signIn(phoneAuthCredential);
  }

  
  void verificationFailed(FirebaseAuthException error) {
    print('verificationFailed : ${error.toString()}');
    emit(PhoneAuthState.error(error: error.toString()));
  }
  void codeSent(String verificationId, int? forceResendingToken) {
    print('codeSent');
    this.verificationId = verificationId;
    print('=================${verificationId}');
    emit(const PhoneAuthState.submited());
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print('codeAutoRetrievalTimeout');
  }

  Future<void> submitOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: this.verificationId, smsCode: otpCode);
    await signIn(credential);
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(const PhoneAuthState.verified());
    } catch (e) {
      emit(PhoneAuthState.error(error: e.toString()));
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  User getLoggedInUser() {
    User firebaseUser = FirebaseAuth.instance.currentUser!;
    return firebaseUser;
  }
}
