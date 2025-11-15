import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/routes/app_routes.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            String name = "Jaimin";
            String address = "B/5 Maple Street, Ahmedabad - 380054";
            //GoRouter.of(context).go("/profile/$name");
            //context.go("/profile/$name");

            //Named Routes: (No Page Stack)
            //context.goNamed(AppRoutes.profile, pathParameters: {"name": name}, queryParameters: {"address": address});
            //without query parameter:
            //context.goNamed(AppRoutes.profile, pathParameters: {"name": name});

            //using pushNamed instead of goNamed (with Page Stack)
            context.pushNamed(AppRoutes.profile, pathParameters: {"name": name}, queryParameters: {"address": address});
          },
          child: const Text("Go to Profile"),
        ),
      ),
    );
  }
}