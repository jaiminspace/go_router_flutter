import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/routes/app_routes.dart';
import '../main.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Login")),
        body: Center(child: Column(
            children: [
              Text("This is login Screen"),
              ElevatedButton(onPressed: (){
                isLoggedIn = true;
                context.goNamed(AppRoutes.dashboard);
              }, child: Text("Login Now"))
            ]),
        ));
  }
}