import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scipro_application/controller/auth_controller/user_uid.dart';
import 'package:scipro_application/view/pages/google_signing/google_signing.dart';

class AuthController extends GetxController {
  final userdetailController = Get.put(UserDetailsFecController());
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final dataserver = FirebaseFirestore.instance;

  Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() async {
    super.onInit();
    await checkSignIn();
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount == null) return null;

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      await _auth.signInWithCredential(credential);
     await userdetailController.fectingStudentDetails();
      return _auth.currentUser;
    } catch (e) {
      log("Error during Google Sign In: $e");
      return null;
    }
  }

  Future<void> checkSignIn() async {
    user.value = FirebaseAuth.instance.currentUser;
  }

  Future<bool> isUserCollectionExist() async {
    try {
      final server = dataserver.collection("StudentProfileCollection");

      final userId = user.value;
      if (userId != null) {
        final userData = await server.doc(userId.uid).get();
        return userData.exists;
      }
      return false;
    } catch (e) {
      log(e.toString(), name: 'AuthController - isUserCollectionExist');
      return false;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    Get.offAll(() =>  GoogleSigninScreen());
    Get.snackbar('Logout', 'Logout Sucessfully');
  }
}
