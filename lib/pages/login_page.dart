// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:messenger_app/auth/authh_service.dart';
import 'package:messenger_app/components/my_button.dart';
import 'package:messenger_app/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  //email pass controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  final void Function()? onTap;

  LoginPage({super.key, this.onTap});

  void login(BuildContext context) async {
// auth service
    final authService = AuthService();
    // try login
    try {
      await authService.signInWithEmailPassword(
          _emailController.text, _passController.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
    // errors
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              height: 50,
            ),
            // welcome messege
            Text(
              "Welcome back you have been missed!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            //email text field
            MyTextField(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
            ),
            const SizedBox(height: 10),
            //pw textfield
            MyTextField(
              hintText: "Password",
              obscureText: true,
              controller: _passController,
            ),
            const SizedBox(height: 25),

            //login button
            MyButton(
              text: "Login",
              onTap: () => login(context),
            ),
            const SizedBox(height: 25),

            //register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member? ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
