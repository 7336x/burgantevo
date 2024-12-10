import 'package:burgantevo/pages/sign_in.dart';
import 'package:burgantevo/pages/sign_up.dart';
import 'package:burgantevo/providers/tripsprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:burgantevo/pages/homepage.dart'; 
import 'package:burgantevo/providers/auth_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()), 
        ChangeNotifierProvider(create: (_) => TripsProvider()),
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
      initialRoute: '/home',  
      routes: {
        '/home': (context) => HomePage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
      },
    );
  }
}
