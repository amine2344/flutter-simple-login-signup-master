import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";

class GetUsernames extends StatelessWidget {
  final String documentId ; 
  const GetUsernames({super.key, required this.documentId});
  @override
  Widget build(BuildContext context) {

    //get the collection 
    CollectionReference users = FirebaseFirestore.instance.collection("users"); 

    return FutureBuilder<DocumentSnapshot>(future: users.doc(documentId).get()  , builder: ((context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done){
        Map<String, dynamic> data  = snapshot.data!.data() as Map<String, dynamic>; 
        print(data['firstname']);
        return Text("${data['firstName']}");
      }
      return const Text("loading ..."); 
    }));
  }
}