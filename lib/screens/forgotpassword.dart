import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/screens/login.dart';
import 'package:todoapp/utils/colors.dart';
import 'package:todoapp/utils/uidesigns.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();
  forgotPassword(String email) async {
    if (email == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color.fromARGB(255, 248, 17, 0),
          content: Center(
            child: Text(
              "Enter an email to reset password",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      );
    } else {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 10),
          backgroundColor: const Color.fromARGB(255, 255, 17, 0),
          content: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Password reset link is sent"),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Text("Go To Login"),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          "Forgot Password",
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(13),
            child: UiHelper.dynaTextfield(
              _emailController,
              "Email",
              Icons.mail,
              false,
              context,
              TextInputAction.next,
            ),
          ),
          const SizedBox(height: 20),
          UiHelper.myButton(
            "Reset Password",
            () {
              forgotPassword(
                _emailController.text.toString(),
              );
            },
            AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
