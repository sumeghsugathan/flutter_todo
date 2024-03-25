import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/screens/homepage.dart';
import 'package:todoapp/screens/login.dart';

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  Widget build(BuildContext context) {
    return checkuser();
  }

  checkuser() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return const Demoto();
    } else {
      return const LoginScreen();
    }
  }
}
