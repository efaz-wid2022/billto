import 'package:bill_to/f_login_controller.dart';
import 'package:bill_to/screen/fb_login_screen.dart';
import 'package:bill_to/screen/login_screen.dart';
import 'package:bill_to/g_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GooleSignInController(),
          child: LoginPage(),
        ),
        ChangeNotifierProvider(
          create: (context) => FacebookSingInController(),
          child: FacebookLoginPage(),
        ),
      ],
      child: MaterialApp(
        // home: FacebookLoginPage(),
        home: FacebookLoginPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
