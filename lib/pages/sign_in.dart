import 'package:burgantevo/providers/auth_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // foregroundColor: Colors.black,
        // elevation: 2,
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo image in the center
            Image.asset(
              'assets/images/logo.png',
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 20),
            const Text(
              "Burgan Tevo",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Color.fromARGB(255, 4, 4, 4),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Sign in",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color.fromARGB(255, 4, 4, 4),
              ),
            ),
            const SizedBox(height: 30),
            // Username input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Username',
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(color: Colors.red),
                ),
                controller: usernameController,
                style: const TextStyle(color: Colors.red),
              ),
            ),
            const SizedBox(height: 20),
            // Password input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(color: Colors.red),
                ),
                controller: passwordController,
                obscureText: true,
                style: const TextStyle(color: Colors.red),
              ),
            ),
            const SizedBox(height: 30),
            // Sign In button
            SizedBox(
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  try {
                    await context.read<AuthProvider>().signin(
                          username: usernameController.text,
                          password: passwordController.text,
                        );

                    var user = context.read<AuthProvider>().user;
                    print("You are logged in as ${user!.username}");
                    context.push('/home');
                  } on DioException catch (e) {
                    if (e.response == null) return;
                    if (e.response!.data == null) return;

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            e.response!.data['message'] ?? "Unexpected error"),
                      ),
                    );
                  }
                },
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            SizedBox(
              width: 150,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  context.push('/sign-up');
                },
                child: const Text(
                  "Don't have an account? Sign Up",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                ),
              ),
            ),

            const SizedBox(height: 50),
            Text(
              context.read<AuthProvider>().user?.username ?? "Not Logged in",
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
