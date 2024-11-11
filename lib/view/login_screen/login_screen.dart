import 'package:applicatiion_uploding/global_widgets/custom_textfield.dart';
import 'package:applicatiion_uploding/global_widgets/refactored_button.dart';
import 'package:applicatiion_uploding/view/home_screen/home_screen.dart';
import 'package:applicatiion_uploding/view/registration_screen/registration_screen.dart';
import 'package:flutter/material.dart';
// Import the registration screen

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              controller: emailController,
              label: "Email",
              keyboardType:
                  TextInputType.emailAddress, // Optional, for email input
            ),
            CustomTextField(
              controller: passwordController,
              label: "Password",
              obscuretext: true,
            ),
            SizedBox(height: 20),
            RefactoredButton(
              label: "Login",
              onTap: () {
                // Implement login logic here
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          RegistrationScreen()), // Navigate to RegisterScreen
                );
              },
              child: Text("Don't have an account? Register now"),
            ),
          ],
        ),
      ),
    );
  }
}
