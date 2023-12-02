import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginSignup/screens/EADashedBoardScreen.dart';
import 'package:loginSignup/screens/LoginOrRegister.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        // Use FutureBuilder to wait for Firebase.initializeApp()
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const EADashedBoardScreen();
                } else {
                  return const LoginOrRegister();
                }
              },
            );
          } else {
            // Show a loading indicator while waiting for Firebase.initializeApp()
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
