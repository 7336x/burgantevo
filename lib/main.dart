import 'package:burgantevo/pages/sign_in.dart';
import 'package:burgantevo/pages/sign_up.dart';
import 'package:burgantevo/providers/tripsprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:burgantevo/pages/homepage.dart'; // Assuming HomePage is in this path
import 'package:burgantevo/providers/auth_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()), // Your auth provider
        ChangeNotifierProvider(create: (_) => TripsProvider()), // Your trips provider
      ],
      child: BurganTevoApp(),
    ),
  );
}

class BurganTevoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Burgan Tevo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/sign-up',  // Change initialRoute to '/sign-up' to open SignUpPage by default
      routes: {
        '/home': (context) => HomePage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
      },
    );
  }
}
