🧭 Flutter Navigation with GoRouter
A clean, modern, and scalable Flutter navigation architecture built using GoRouter, the recommended routing package for Flutter. This project demonstrates declarative routing, nested navigation, deep linking, and organized route management suitable for small and enterprise-level apps.

✨ Features
✅ Declarative Navigation
Centralized routing configuration using GoRouter for clean and maintainable navigation.
✅ Nested Routes
Handles nested pages like Dashboard → Profile, Settings, etc.
✅ Named Routes
Uses name: for safer and structured navigation.
✅ Path Parameters
Supports dynamic routes like:
/profile/:name

✅ Custom Animations
Reusable transition builders for page animations (slide, fade, scale, etc.)
✅ Authentication-Aware Routing
Easy to plug in login guards or role-based access control.
✅ Deep Linking + Web Support
Work seamlessly on Android, iOS, and Flutter Web.

📂 Project Structure
lib/
├── main.dart
├── routes/
│     └── app_router.dart         # All GoRouter setup here
├── screens/
│     ├── login.dart
│     ├── dashboard.dart
│     ├── profile.dart
│     └── ...
└── widgets/
└── ...


🚀 Getting Started
1️⃣ Clone the repo
git clone https://github.com/your-username/your-repo-name.git

2️⃣ Install dependencies
flutter pub get

3️⃣ Run the project
flutter run


🗺`️ GoRouter Setup Example
final GoRouter router = GoRouter(
routes: [
GoRoute(
path: '/',
name: 'login',
builder: (context, state) => const Login(),
),
GoRoute(
path: '/dashboard',
name: 'dashboard',
builder: (context, state) => const Dashboard(),
routes: [
GoRoute(
path: 'profile/:name',
name: 'profile',
builder: (context, state) =>
Profile(name: state.pathParameters['name'] ?? ''),
),
],
),
],
);`


🛠️ Tech Stack
TechnologyPurposeFlutterUI frameworkDartProgramming languageGoRouterAdvanced navigationMaterial 3Modern UI

🎯 Why GoRouter?
Built and recommended by Flutter team
Declarative & clean
Handles web URLs automatically
Fewer bugs than Navigator 2.0 boilerplate
Easy deep linking

📌 TODO / Improvements
Add Authentication guard
Add bottom navigation bar routing
Add API integration
Add state management (Provider / Riverpod / Bloc)
Add error page & no-internet page

🤝 Contributing
Pull requests are welcome.
Feel free to open issues for new features or bug fixes.
