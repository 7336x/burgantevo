import 'package:burgantevo/pages/homepage.dart';
import 'package:burgantevo/pages/sign_in.dart';
import 'package:burgantevo/pages/sign_up.dart';
import 'package:burgantevo/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
      ],
      child: BurganTevoApp(),
    ),
  );
}

class BurganTevoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize auth status when app starts
    Future.delayed(Duration.zero, () {
      context.read<AuthProvider>().initAuth();
    });

    return MaterialApp(
      title: 'Burgan Tevo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/sign-up',
      routes: {
        '/home': (context) {
          final authProvider = Provider.of<AuthProvider>(context);
          return authProvider.isAuth() ? HomePage() : SignInPage();
        },
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
      },
    );
  }
}
