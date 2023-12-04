import 'package:adaptive_theme/adaptive_theme.dart';

import 'package:flutter/material.dart';
import 'package:loginSignup/screens/EADashedBoardScreen.dart';
import 'package:loginSignup/screens/auth_page.dart';


import 'package:firebase_core/firebase_core.dart';
import 'package:loginSignup/utils/EADataProvider.dart';
import 'package:rxdart/rxdart.dart';

import 'firebase_options.dart';
// core Flutter primitives
import 'package:flutter/foundation.dart';






void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(
    options:  FirebaseOptions(
    apiKey: 'AIzaSyCigTkFC6BmldxMUdY2m1yZTWI4-0G2BP8',
    appId: '1:833130301180:ios:cb070dc1bec4748d04f979',
    messagingSenderId: '833130301180',
    projectId: 'ravish-ae358',
    storageBucket: 'ravish-ae358.appspot.com',
    iosBundleId: 'com.adeelsafdar.loginSignup',
  ),


  );
  

  
    await initializeOtherClass();

// TODO: replace with your own VAPID key

  
  
  

   
 // TODO: Register with FCM


 // TODO: Set up foreground message handler


  


  

  runApp(const MyApp());



}
Future<void> initializeOtherClass() async {
  // Perform any initialization tasks here
  await ListEvents.initialise() ; 
   WidgetsFlutterBinding.ensureInitialized(); 

  await Future.delayed(Duration(seconds: 2)); // Simulated initialization delay
  
  print('Other class initialized');
}




late _MyAppState settingUI;

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  
  
  @override
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
        home: const AuthPage(),
      ),
    ),);
  }
  @override
  _MyAppState createState() => _MyAppState();
  // This widget is the root of your application.

}
class _MyAppState extends State<MyApp> {
 String _lastMessage = "";

 _MyAppState() {
   
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

