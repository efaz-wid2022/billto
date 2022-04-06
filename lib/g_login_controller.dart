import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GooleSignInController with ChangeNotifier {
  var _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleAccout;

  login() async {
    this.googleAccout = await _googleSignIn.signIn();
    notifyListeners();
  }

  logOut() async {
    this.googleAccout = await _googleSignIn.signOut();
    notifyListeners();
  }
}
