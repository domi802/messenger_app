import 'package:flutter/material.dart';
import 'package:messenger_app/components/my_button.dart';
import 'package:messenger_app/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  final void Function()? onTap;

  RegisterPage({super.key, this.onTap});

  //register

  void register() {}

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
              "Let's create an account for you",
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
            const SizedBox(height: 10),
            //pw textfield
            MyTextField(
              hintText: "Confirm Password",
              obscureText: true,
              controller: _confirmController,
            ),

            const SizedBox(height: 25),

            //login button
            MyButton(
              text: "Register",
              onTap: register,
            ),
            const SizedBox(height: 25),

            //register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
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
