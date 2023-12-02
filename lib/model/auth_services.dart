

import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

class AuthService {



  Future<void> initNotification () async { 

   /*  NavigatorKey.currentState?.pushNamed{
      'EdashedBoardScreen', 
      arguments: message , 


    } */
  }
  Future inithandleNotifications() async { 
    //handle notifications if the app terminated and  now opened

 }
  //google sign in :  
  signInWithGoogle() async {
    final GoogleSignInAccount? guser  = await GoogleSignIn().signIn() ; 

    final GoogleSignInAuthentication gAhuth = await guser!.authentication ; 
    
    final credential  =  GoogleAuthProvider.credential(
      accessToken: gAhuth.accessToken,
      idToken: gAhuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
      }
      
}