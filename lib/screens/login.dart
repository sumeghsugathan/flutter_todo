import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/screens/forgotpassword.dart';
import 'package:todoapp/screens/homepage.dart';
import 'package:todoapp/screens/signup.dart';
import 'package:todoapp/utils/colors.dart';
import 'package:todoapp/utils/uidesigns.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //controllers
  final _usercontroller = TextEditingController();
  final _pascontroller = TextEditingController();

  login(String username, String password) async {
    if (username == "" && password == "") {
      return ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color.fromARGB(255, 255, 17, 1),
          content: Center(
            child: Text(
              "Fill the credentials to login",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      );
    } else {
      UserCredential? userCredential;
      try {
        //firebase
        userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: username, password: password);

        if (mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Demoto(),
            ),
          );
        }
      } on FirebaseAuthException catch (ex) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: const Color.fromARGB(255, 255, 17, 0),
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
        automaticallyImplyLeading: false,
        title: const Text(
          "Login Page",
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
              child: UiHelper.dynaTextfield(
                _usercontroller,
                "Enter username",
                Icons.person,
                false,
                context,
                TextInputAction.next
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: UiHelper.dynaTextfield(
                _pascontroller,
                "enter password",
                Icons.password,
                true,
                context,
                TextInputAction.next
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: UiHelper.myButton(
                "Login",
                () {
                  login(
                    _usercontroller.text.toString(),
                    _pascontroller.text.toString(),
                  );
                },
                AppColors.primaryColor,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ForgotPassword(),
                  ),
                );
              },
              child: const Text(
                "Forgot Password",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const SignupScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Sign Up",
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
