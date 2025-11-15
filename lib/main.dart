import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_flutter/screens/dashboard.dart';
import 'package:go_router_flutter/screens/error_page.dart';
import 'package:go_router_flutter/screens/login.dart';
import 'package:go_router_flutter/screens/profile.dart';

import 'core/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router, title: 'Go Router');
  }
}

var isLoggedIn = false;

final router = GoRouter(
  initialLocation: "/",
  redirect: (context, state) {

    //DEEP LINK COMMAND TO CHECK:
    //adb shell am start -a android.intent.action.VIEW -d "myapp://app/dashboard/profile/jaimin"
    final rawPath = state.uri.path;
    final path = rawPath.startsWith("/") ? rawPath : "/$rawPath";
    if (path.startsWith("/dashboard/profile/")) {
      return null;
    }

    //If logged in, redirect to dashboard from login page
    if (isLoggedIn && path == "/") {
      return "/dashboard";
    }

    //If not logged in, redirect to login page from other pages
    if (!isLoggedIn && path != "/") {
      return "/";
    }
    // Otherwise allow navigation
    return null;
  },
  routes: [
    GoRoute(
      path: "/",
      name: AppRoutes.login,
      builder: (context, state) => Login(),
    ),
    GoRoute(
      name: AppRoutes.dashboard,
      path: "/dashboard",
      builder: (context, state) => Dashboard(),
      routes: [
        GoRoute(
          name: AppRoutes.profile,
          path: "profile/:name",
          builder: (context, state) => Profile(
            name: state.pathParameters["name"]!,
            address:
                state.uri.queryParameters["address"] ?? "No Address Provided",
          ),
        ),
      ],
    ),
    GoRoute(
      pageBuilder: (context, state) => fadeTransitionPage(
        key: state.pageKey,
        child: const ErrorPage(),
        duration: Duration(seconds: 4),
      ),
      path: "error_page",
      name: AppRoutes.errorPage,
    ),
  ],
  // IMPORTANT — this provides a Page, not a Widget.
  errorPageBuilder: (context, state) =>
      fadeTransitionPage(key: state.pageKey, child: const ErrorPage()),
);

CustomTransitionPage fadeTransitionPage({
  required LocalKey key,
  required Widget child,
  Duration duration = const Duration(seconds: 2),
}) {
  return CustomTransitionPage(
    key: key,
    transitionDuration: duration,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOutCirc,
        ),
        child: child,
      );
    },
  );
}
