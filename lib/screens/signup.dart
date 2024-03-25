import 'package:flutter/material.dart';
import 'package:todoapp/screens/login.dart';
import 'package:todoapp/utils/colors.dart';
import 'package:todoapp/utils/uidesigns.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _usercontroller = TextEditingController();

  final _pascontroller = TextEditingController();

  signUp(String username, String password) async {
    if (username == "" && password == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color.fromARGB(255, 255, 17, 1),
          content: Center(
            child: Text(
              "Fill the credentials to signup",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      );
    } else {
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: username, password: password);
        if (mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        }
      } on FirebaseAuthException catch (ex) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: const Color.fromARGB(255, 255, 17, 1),
              content: Center(
                child: Text(
                  ex.code.toString(),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: const Text(
          "Sign Up Page",
          style: TextStyle(
            color: AppColors.textColor,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: UiHelper.dynaTextfield(_usercontroller, "enter username",
                  Icons.person, false, context, TextInputAction.next),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: UiHelper.dynaTextfield(_pascontroller, "enter password",
                  Icons.password, true, context, TextInputAction.next),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: UiHelper.myButton("Sign Up", () {
                signUp(
                  _usercontroller.text.toString(),
                  _pascontroller.text.toString(),
                );
              }, AppColors.primaryColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account"),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Login",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
