// ignore_for_file: use_build_context_synchronously, unused_local_variable, library_private_types_in_public_api

import 'package:femalert2/base/widgets/custom.textfield.dart';
import 'package:femalert2/base/widgets/firebase.button.dart';
import 'package:femalert2/base/widgets/logo.dart';
import 'package:femalert2/screens/auth/reset/reset.dart';
import 'package:femalert2/screens/auth/signup/signup.dart';
import 'package:femalert2/screens/home/raksha.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  void signIn(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailTextController.text,
        password: _passwordTextController.text,
      );
      // Navigate to the first main.dart file
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Raksha()),
      );
    } catch (error) {
      if (kDebugMode) {
        print("Error $error");
      }
    }
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFCB2B93),
            Color(0xFF9546C4),
            Color(0xFF5E61F4)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            children: <Widget>[
              const Column(
                children: [
                  Text(
                    "Welcome to",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    "FemAlert",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              logoWidget("assets/images/logo1.png"),
              const SizedBox(
                height: 40,
              ),
              customTextField(
                "Enter email",
                Icons.person_outline,
                false,
                _emailTextController,
              ),
              const SizedBox(
                height: 20,
              ),
              customTextField(
                "Enter Password",
                Icons.lock_outline,
                true,
                _passwordTextController,
              ),
              const SizedBox(
                height: 5,
              ),
              forgetPassword(context),
              firebaseButton(context, "Sign In", () {
                signIn(context);
              }),
              signUpOption(),
            ],
          ),
        ),
      ),
    ),
  );
}


  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.white70),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUpScreen()),
            );
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ResetPassword()),
        ),
      ),
    );
  }
}
