// import 'package:burgantevo/pages/sign_in.dart';
// import 'package:burgantevo/pages/sign_up.dart';
// import 'package:burgantevo/providers/tripsprovider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:burgantevo/pages/homepage.dart'; // Assuming HomePage is in this path
// import 'package:burgantevo/providers/auth_provider.dart';
// import 'package:burgantevo/pages/create_trip_page.dart';

// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//             create: (_) => AuthProvider()), // Your auth provider
//         ChangeNotifierProvider(
//             create: (_) => TripsProvider()), // Your trips provider
//       ],
//       child: BurganTevoApp(),
//     ),
//   );
// }

// class BurganTevoApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Burgan Tevo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/home',
//       routes: {
//         '/home': (context) => HomePage(),
//         '/sign-in': (context) => SignInPage(),
//         '/sign-up': (context) => SignUpPage(),
//         '/create-trip': (context) => CreateTripPage()
//       },
//     );
//   }
// }
import 'package:burgantevo/pages/sign_in.dart';
import 'package:burgantevo/pages/sign_up.dart';
import 'package:burgantevo/providers/tripsprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:burgantevo/pages/homepage.dart';
import 'package:burgantevo/providers/auth_provider.dart';
import 'package:burgantevo/pages/create_trip_page.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => TripsProvider()),
      ],
      child: const BurganTevoApp(),
    ),
  );
}

class BurganTevoApp extends StatelessWidget {
  const BurganTevoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Burgan Tevo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: _router, // Attach GoRouter configuration
    );
  }
}

// GoRouter configuration
final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/sign-in',
      builder: (context, state) => SignInPage(),
    ),
    GoRoute(
      path: '/sign-up',
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      path: '/create-trip',
      builder: (context, state) => CreateTripPage(),
    ),
  ],
  initialLocation: '/sign-up', // Sets the initial route
);
