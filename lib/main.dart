import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/screens/auth_page.dart';


import 'package:firebase_core/firebase_core.dart';
import 'package:login_signup/screens/splash_screen.dart';
import 'package:login_signup/utils/EADataProvider.dart';
import 'package:rxdart/rxdart.dart';

import 'firebase_options.dart';
// core Flutter primitives
import 'package:flutter/foundation.dart';


// FlutterFire's Firebase Cloud Messaging plugin

final _messageStreamController = BehaviorSubject<RemoteMessage>();


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  if (kDebugMode) {
   print("Handling a background message: ${message.messageId}");
   print('Message data: ${message.data}');
   print('Message notification: ${message.notification?.title}');
   print('Message notification: ${message.notification?.body}');
 }
}



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await initializeOtherClass();
  runApp(const MyApp());



}
Future<void> initializeOtherClass() async {
  // Perform any initialization tasks here
  await ListEvents.initialise() ; 
  await Future.delayed(const Duration(seconds: 2)); // Simulated initialization delay
  
  
}




late _MyAppState settingUI;

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  
  
  Widget build(BuildContext context) {
   return  MaterialApp(
     initialRoute: '/', // Set your initial route (if needed).
     
     
    
     home: AdaptiveTheme(
      light: ThemeData.light(useMaterial3: true),
      dark: ThemeData.dark(useMaterial3: true),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        
        
        title: 'login',
        theme: theme,
        darkTheme: darkTheme,
       // home: const MyAppWithSplash(),
      ),
    ),);
  }

  
  @override
  _MyAppState createState() => _MyAppState();
  // This widget is the root of your application.

}

class MyAppWithSplash extends StatefulWidget {
  const MyAppWithSplash({super.key});

  @override
  _MyAppWithSplashState createState() => _MyAppWithSplashState();
}

class _MyAppWithSplashState extends State<MyAppWithSplash> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeOtherClass(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const AuthPage(); // Navigate to AuthPage after initialization
        } else {
          return const SplashScreen(); // Show SplashScreen while initializing
        }
      },
    );
  }
}
class _MyAppState extends State<MyApp> {


 _MyAppState() {
   _messageStreamController.listen((message) {
     setState(() {
       if (message.notification != null) {
       } else {
       }
     });
   });
 }

  Color primaryColor = Colors.blue;
  Color accentColor = Colors.blue;
  bool isDarkMode = true;

  void callSetState() {
    setState(() {
      isDarkMode =  !isDarkMode ;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    settingUI = this;

    
     return MaterialApp(
       initialRoute: '/', // Set your initial route (if needed).
     
     
     
       home:  WillPopScope(
    onWillPop: () async {
      // Handle the back button press as needed
      // For example, you can show a confirmation dialog before allowing navigation.
      // If you want to navigate back without confirmation, simply return true.
      return true; // Return false to prevent navigation
    },
  child: AdaptiveTheme(
    
      light: ThemeData.light(useMaterial3: true),
      dark: ThemeData.dark(useMaterial3: true),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
       
         title: 'login',
        theme: theme,
        darkTheme: darkTheme,
        home: const AuthPage(), 
      ),
    ),),);
  }
}


