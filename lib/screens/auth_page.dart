import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/screens/EADashedBoardScreen.dart';
import 'package:login_signup/screens/LoginOrRegister.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/screens/auth_page.dart';


import 'package:firebase_core/firebase_core.dart';
import 'package:login_signup/screens/splash_screen.dart';
import 'package:login_signup/utils/EADataProvider.dart';
import 'package:rxdart/rxdart.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Add a loading indicator for the initial state
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            return const EADashedBoardScreen();
          } else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}


