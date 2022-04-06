import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookSingInController with ChangeNotifier {
  Map? userData;

  login() async {
    final result = await FacebookAuth.i.login(
      permissions: ["public_profile", "email"],
    );
    if (result.status == LoginStatus.success) {
      final requsetData = await FacebookAuth.i.getUserData(
        fields: "email, name, picture",
      );
      userData = requsetData;
      notifyListeners();
    }
  }
  // login() async {
  //   try {
  //     final result = await FacebookAuth.i.login(
  //       permissions: [
  //         'user_profile',
  //         'email',
  //       ],
  //     );
  //     if (result.status == LoginStatus.success) {
  //       final userData = await FacebookAuth.i.getUserData();
  //       print(userData);
  //     }
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  logOut() async {
    await FacebookAuth.i.logOut();
    userData = null;
    notifyListeners();
  }
}