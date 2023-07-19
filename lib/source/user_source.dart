import 'package:cloud_firestore/cloud_firestore.dart';

import '../config/session.dart';
import '../model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class UserSource {
  static Future<Map<String, dynamic>> signup(String fullname, String email,
      String createpassword, String confirmPassword) async {
    Map<String, dynamic> response = {};
    try {
      final credential = await auth.FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email, password: createpassword);
      response['success'] = true;
      response['message'] = 'Sign Up Success';
      String uid = credential.user!.uid;
      User user = User(
        id: uid,
        fullName: fullname,
        email: email,
        createPassword: createpassword,
        confirmPassword: confirmPassword,
      );
      await FirebaseFirestore.instance
          .collection('User')
          .doc(uid)
          .set(user.toJson());
      Session.saveUser(user);
    } on auth.FirebaseAuthException catch (e) {
      response['success'] = false;
      if (e.code == 'weak-password') {
        response['message'] = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        response['message'] = 'The account already exists for that email.';
      } else {
        response['message'] = 'Sign up failed';
      }
    }
    return response;
  }

  static Future<Map<String, dynamic>> signIn(
      String email, String createpassword) async {
    Map<String, dynamic> response = {};
    try {
      final credential = await auth.FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: createpassword);
      response['success'] = true;
      response['message'] = 'Sign In Success';
      String uid = credential.user!.uid;
      User user = await getWhereId(uid);
      Session.saveUser(user);
    } on auth.FirebaseAuthException catch (e) {
      response['success'] = false;
      if (e.code == 'user-not-found') {
        response['message'] = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        response['message'] = 'Wrong password provided for that user.';
      } else {
        response['message'] = 'Sign in failed';
      }
    }
    return response;
  }

  static Future<User> getWhereId(String id) async {
    DocumentReference<Map<String, dynamic>> ref =
        FirebaseFirestore.instance.collection('User').doc(id);
    DocumentSnapshot<Map<String, dynamic>> doc = await ref.get();
    return User.fromJson(doc.data()!);
  }
}
