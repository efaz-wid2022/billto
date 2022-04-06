import 'package:bill_to/f_login_controller.dart';
import 'package:bill_to/g_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FacebookLoginPage extends StatefulWidget {
  const FacebookLoginPage({Key? key}) : super(key: key);

  @override
  State<FacebookLoginPage> createState() => _FacebookLoginPageState();
}

class _FacebookLoginPageState extends State<FacebookLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BillTo"),
        backgroundColor: Colors.yellow.shade400,
      ),
      body: loginUi(),
    );
  }

  loginUi() {
    return Consumer<FacebookSingInController>(
      builder: (context, model, child) {
        if (model.userData != null) {
          return Center(
            child: loggedInUi(model),
          );
        } else {
          return loginConterols(context);
        }
      },
    );
  }

  loggedInUi(FacebookSingInController model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // CircleAvatar(
        //   backgroundImage:
        //   Image.network(model.userData!["picture"]["data"]["url"] ?? '').image,
        //   radius: 50,
        // ),
        Text(model.userData!["name"] ?? ''),
        Text(model.userData!["email"]),
        ActionChip(
          avatar: Icon(Icons.logout),
          label: Text("Logout"),
          onPressed: () {
            Provider.of<FacebookSingInController>(
              context,
              listen: false,
            ).logOut();
          },
        )
      ],
    );
  }

  loginConterols(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Image.asset(
              "assets/g_logo.png",
              width: 250,
            ),
            onTap: () {
              Provider.of<GooleSignInController>(context, listen: false)
                  .login();
            },
          ),
          GestureDetector(
            child: Image.asset(
              "assets/f_logo.png",
              width: 250,
            ),
            onTap: () {
              Provider.of<FacebookSingInController>(context, listen: false)
                  .login();
            },
          ),
        ],
      ),
    );
  }
}
