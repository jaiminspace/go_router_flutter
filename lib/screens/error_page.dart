import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/routes/app_routes.dart';
import '../main.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Error Page")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Something Went Wrong!"),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    isLoggedIn = false;
                    context.goNamed(AppRoutes.login);
                  },
                  child: Text("Retry"),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    isLoggedIn = true;
                    context.goNamed(
                      AppRoutes.profile,
                      pathParameters: {"name": "Jaimin"},
                    );
                  },
                  child: Text("Go Back"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}