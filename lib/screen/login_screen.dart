import 'package:bill_to/g_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    return Consumer<GooleSignInController>(
      builder: (context, model, child) {
        if (model.googleAccout != null) {
          return Center(
            child: loggedInUi(model),
          );
        } else {
          return loginConterols(context);
        }
      },
    );
  }

  loggedInUi(GooleSignInController model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage:
              Image.network(model.googleAccout!.photoUrl ?? '').image,
          radius: 50,
        ),
        Text(model.googleAccout!.displayName ?? ''),
        Text(model.googleAccout!.email),
        ActionChip(
          avatar: Icon(Icons.logout),
          label: Text("Logout"),
          onPressed: () {
            Provider.of<GooleSignInController>(
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
          Image.asset(
            "assets/f_logo.png",
            width: 250,
          ),
        ],
      ),
    );
  }
}
