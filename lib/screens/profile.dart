import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/routes/app_routes.dart';

class Profile extends StatelessWidget {
  final String name;
  final String? address;
  const Profile({super.key, required this.name, this.address});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome $name")),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: double.infinity),
            SizedBox(height: 70),
            Text("Name: $name"),
            SizedBox(height: 10),
            Text("Address: $address"),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => context.goNamed(AppRoutes.dashboard),
              child: const Text("Go Back"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => context.pushNamed(AppRoutes.errorPage),
              child: const Text("View Error Page"),
            ),
          ]
      ),
    );
  }
}