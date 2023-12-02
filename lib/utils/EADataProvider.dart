

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loginSignup/model/EAActivityModel.dart';
import 'package:loginSignup/model/EAEventListModel.dart';
import 'package:loginSignup/model/EAForYouModel.dart';
import 'package:loginSignup/model/EAInboxModel.dart';
import 'package:loginSignup/model/EAReviewModel.dart';
import 'package:loginSignup/model/EATicketModel.dart';
import 'package:loginSignup/model/EAWalkThroughModel.dart';
import 'package:loginSignup/utils/EAConstants.dart';
import 'package:flutter/material.dart';
import 'EAImages.dart';


class ListEvents extends StatefulWidget {
  const ListEvents({super.key});

  @override
  State<ListEvents> createState() => _ListEventsState();
static Future<List<Map<String, dynamic>>> fetchData() async {
  CollectionReference collectionRef = FirebaseFirestore.instance.collection('new_event');
  QuerySnapshot querySnapshot = await collectionRef.get();
  return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
}

  static initialise()  async {
    return FutureBuilder<List<Object?>>(
  future: () async {
    CollectionReference collectionRef = FirebaseFirestore.instance.collection('new_event');
    QuerySnapshot querySnapshot = await collectionRef.get();

    List<Map<String, dynamic>> dataFromFirestore = querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

    for (var itemData in dataFromFirestore) {
      walkThroughList.add(EAWalkThrough(
        image: itemData["event_photo"].toString(),
        subtitle: itemData["event_location"].toString(),
        title: itemData["event_name"].toString(),
      ));

      about.add(AboutData(about: itemData["event_about"].toString()));
      hashtagList.add(EACityModel(
        image: itemData["event_photo"].toString(),
        name: itemData["event_name"].toString(),
        subtitle: itemData["event_location"].toString(),
        isSelected: false,
        selectHash: false,
      ));

      forYouList.add(EAForYouModel(
        host: itemData["event_host"].toString(),
        add: itemData["event_location"].toString(),
        attending: itemData["event_cat"].toString(),
        hashtag: itemData["event_location"].toString(),
        image: itemData["event_photo"].toString(),
        distance: 12,
        fev: false,
        rating: 12,
        name: itemData["event_name"].toString(),
        price: itemData["event_cat"].toString(),
        time: itemData["event_date"].toString(),
      ));

      imageList.add(EAActivityModel(
        image: itemData["event_photo"].toString(),
        name: itemData["event_name"].toString(),
        icon: Icons.airplanemode_active,
        subtime: "dafa",
        subtitle: itemData["event_date"].toString(),
        time: itemData["event_date"].toString(),
      ));
    }

    return dataFromFirestore; // Return the data if needed
  }(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Center(child: Text('Error: ${snapshot.error}'));
    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return const Center(child: Text('No data available'));
    } else {
      // Return any other widgets you need to build
      return const Text("fail"); 
    }
  },
);

  }
}

class _ListEventsState extends State<ListEvents> {
  
  
  
   
  
  @override
  Widget build(BuildContext context) {
    
    
         
    return  const Text("help");
    
  }
}

List<EAWalkThrough> walkThroughList = [
  EAWalkThrough(image: event_ic_walk_through2, title: "EVENTS COLLECTION", subtitle: "Discover the best things to do this week in this city"),
  EAWalkThrough(image: event_ic_walk_through3, title: "CONNECT & FOLLOW", subtitle: "Connect with your friends, follow tastemakers and people who share your interest."),
  EAWalkThrough(image: event_ic_walk_through1, title: "BOOK & SHARE", subtitle: "Book events so easy in this two steps ans share it with your friends."),
];

List<EACityModel> cityList = [
  EACityModel(name: "London", subtitle: "UK", image: event_ic_london),
  EACityModel(name: "New York", subtitle: "USA", image: event_ic_newYork),
  EACityModel(name: "Paris", subtitle: "France", image: event_ic_paris),
  EACityModel(name: "Tokyo", subtitle: "Japan", image: event_ic_tokyo),
  EACityModel(name: "London", subtitle: "UK", image: event_ic_london),
  EACityModel(name: "New york", subtitle: "USA", image: event_ic_newYork),
];

List<AboutData> about =[
  
  
];
List<EACityModel> hashtagList = [
  EACityModel(name: "music", subtitle: "2k+ events", image: event_ic_music, selectHash: true),
  EACityModel(name: "festival", subtitle: "800+ events", image: event_ic_walk_through3, selectHash: true),
  EACityModel(name: "food", subtitle: "1.5k+ events", image: event_ic_food, selectHash: false),
  EACityModel(name: "cinema", subtitle: "3.4k+ events", image: event_ic_cinema, selectHash: false),
  EACityModel(name: "music", subtitle: "800+ events", image: event_ic_music, selectHash: false),
  EACityModel(name: "festival", subtitle: "1.5k+ events", image: event_ic_walk_through3, selectHash: false),
];

List<EACityModel> filterDateList = [
  EACityModel(name: "All Dates"),
  EACityModel(name: "Today"),
  EACityModel(name: "Tomorrow"),
  EACityModel(name: "This week"),
];

List<EACityModel> filterHashtagList = [
  EACityModel(name: "All Hashtags", isSelected: false),
  EACityModel(name: "music", isSelected: false),
  EACityModel(name: "festival", isSelected: false),
  EACityModel(name: "food", isSelected: false),
  EACityModel(name: "cinema", isSelected: false),
  EACityModel(name: "music", isSelected: false),
  EACityModel(name: "festival", isSelected: false),
];
List<EAForYouModel> forYouList = [
 
 
];

List<EAForYouModel> getMayKnowData() {
  List<EAForYouModel> list = [];
  list.add(EAForYouModel(name: "jose Lowe", add: "156 followers", image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.9.jpg', fev: false));
  list.add(EAForYouModel(name: "Smit Jhon", add: "200 followers", image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.1.jpg', fev: false));
  list.add(EAForYouModel(name: "Louisa Lyons", add: "230 followers", image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.2.jpg', fev: false));
  list.add(EAForYouModel(name: "Hulda James", add: "100 followers", image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.3.jpg', fev: false));
  list.add(EAForYouModel(name: "Bessie Mendoza", add: "150 followers", image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.4.jpg', fev: false));
  list.add(EAForYouModel(name: "Matilda MCGuire", add: "260 followers", image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.9.jpg', fev: false));
  list.add(EAForYouModel(name: "Harriett Coleman", add: "400 followers", image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.1.jpg', fev: false));
  return list;
}

List<EAMessageModel> getChatMsgData() {
  List<EAMessageModel> list = [];

  EAMessageModel c1 = EAMessageModel();
  c1.senderId = EASender_id;
  c1.receiverId = EAReceiver_id;
  c1.msg = 'Helloo';
  c1.time = '1:43 AM';
  list.add(c1);

  EAMessageModel c2 = EAMessageModel();
  c2.senderId = EASender_id;
  c2.receiverId = EAReceiver_id;
  c2.msg = 'How are you? What are you doing?';
  c2.time = '1:45 AM';
  list.add(c2);

  EAMessageModel c3 = EAMessageModel();
  c3.senderId = EAReceiver_id;
  c3.receiverId = EASender_id;
  c3.msg = 'Helloo...';
  c3.time = '1:45 AM';
  list.add(c3);

  EAMessageModel c4 = EAMessageModel();
  c4.senderId = EASender_id;
  c4.receiverId = EAReceiver_id;
  c4.msg = 'I am good. Can you do something for me? I need your help.';
  c4.time = '1:45 AM';
  list.add(c4);

  EAMessageModel c5 = EAMessageModel();
  c5.senderId = EASender_id;
  c5.receiverId = EAReceiver_id;
  c5.msg = 'I am good. Can you do something for me? I need your help.';
  c5.time = '1:45 AM';
  list.add(c5);

  EAMessageModel c6 = EAMessageModel();
  c6.senderId = EAReceiver_id;
  c6.receiverId = EASender_id;
  c6.msg = 'I am good. Can you do something for me? I need your help.';
  c6.time = '1:45 AM';
  list.add(c6);

  EAMessageModel c7 = EAMessageModel();
  c7.senderId = EASender_id;
  c7.receiverId = EAReceiver_id;
  c7.msg = 'I am good. Can you do something for me? I need your help.';
  c7.time = '1:45 AM';
  list.add(c7);

  EAMessageModel c8 = EAMessageModel();
  c8.senderId = EAReceiver_id;
  c8.receiverId = EASender_id;
  c8.msg = 'I am good. Can you do something for me? I need your help.';
  c8.time = '1:45 AM';
  list.add(c8);

  EAMessageModel c9 = EAMessageModel();
  c9.senderId = EASender_id;
  c9.receiverId = EAReceiver_id;
  c9.msg = 'I am good. Can you do something for me? I need your help.';
  c9.time = '1:45 AM';
  list.add(c9);

  EAMessageModel c10 = EAMessageModel();
  c10.senderId = EAReceiver_id;
  c10.receiverId = EASender_id;
  c10.msg = 'I am good. Can you do something for me? I need your help.';
  c10.time = '1:45 AM';
  list.add(c10);

  EAMessageModel c11 = EAMessageModel();
  c11.senderId = EAReceiver_id;
  c11.receiverId = EASender_id;
  c11.msg = 'I am good. Can you do something for me? I need your help.';
  c11.time = '1:45 AM';
  list.add(c11);

  EAMessageModel c12 = EAMessageModel();
  c12.senderId = EASender_id;
  c12.receiverId = EAReceiver_id;
  c12.msg = 'I am good. Can you do something for me? I need your help.';
  c12.time = '1:45 AM';
  list.add(c12);

  EAMessageModel c13 = EAMessageModel();
  c13.senderId = EASender_id;
  c13.receiverId = EAReceiver_id;
  c13.msg = 'I am good. Can you do something for me? I need your help.';
  c13.time = '1:45 AM';
  list.add(c13);

  EAMessageModel c14 = EAMessageModel();
  c14.senderId = EAReceiver_id;
  c14.receiverId = EASender_id;
  c14.msg = 'I am good. Can you do something for me? I need your help.';
  c14.time = '1:45 AM';
  list.add(c14);

  EAMessageModel c15 = EAMessageModel();
  c15.senderId = EASender_id;
  c15.receiverId = EAReceiver_id;
  c15.msg = 'I am good. Can you do something for me? I need your help.';
  c15.time = '1:45 AM';
  list.add(c15);

  EAMessageModel c16 = EAMessageModel();
  c16.senderId = EAReceiver_id;
  c16.receiverId = EASender_id;
  c16.msg = 'I am good. Can you do something for me? I need your help.';
  c16.time = '1:45 AM';
  list.add(c16);

  EAMessageModel c17 = EAMessageModel();
  c17.senderId = EASender_id;
  c17.receiverId = EAReceiver_id;
  c17.msg = 'I am good. Can you do something for me? I need your help.';
  c17.time = '1:45 AM';
  list.add(c17);

  EAMessageModel c18 = EAMessageModel();
  c18.senderId = EAReceiver_id;
  c18.receiverId = EASender_id;
  c18.msg = 'I am good. Can you do something for me? I need your help.';
  c18.time = '1:45 AM';
  list.add(c18);

  return list;
}

List<EAEventList> eventList = [
  EAEventList(name: "Fashion finest AW17 During London Fashion Week", date: "MAR 30,2016", image: event_ic_paris),
  EAEventList(name: "Bike New York For Bike Month", date: "MAR 24,2018", image: event_ic_tokyo),
  EAEventList(name: "Washington Square Outdoor Art Exhibit", date: "MAR 20,2018", image: event_ic_newYork),
  EAEventList(name: "Why Las vegas hotal Room For you", date: "MAR 15,2018", image: event_ic_festival),
  EAEventList(name: "Bike New York For Bike Month", date: "MAR 24,2018", image: event_ic_music),
  EAEventList(name: "Washington Square Outdoor Art Exhibit", date: "MAR 20,2018", image: event_ic_london),
  EAEventList(name: "Why Las vegas hotal Room For you", date: "MAR 15,2018", image: event_ic_walk_through1),
];

List<EAReviewModel> reviewList() {
  List<EAReviewModel> list = [];
  list.add(EAReviewModel(name: "jose Lowe", image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.9.jpg', fev: false, time: "3 Hours ago", rating: 4.3, like: 12, msg: "Good"));
  list.add(EAReviewModel(name: "Smit Jhon", image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.1.jpg', fev: false, time: "4 Hours ago", rating: 1, like: 1, msg: "Awesome images..."));
  list.add(EAReviewModel(name: "Louisa Lyons", image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.2.jpg', fev: false, time: "6 Hours ago", rating: 3.4, like: 6, msg: "great event"));
  list.add(EAReviewModel(name: "Hulda James", image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.3.jpg', fev: false, time: "8 Hours ago", rating: 4, like: 2, msg: "very nice"));
  list.add(EAReviewModel(name: "Bessie Mendoza", image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.4.jpg', fev: false, time: "8 Hours ago", rating: 3, like: 1));
  list.add(EAReviewModel(name: "Matilda MCGuire", image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.9.jpg', fev: false, time: "9 Hours ago", rating: 2, like: 3));
  list.add(
      EAReviewModel(name: "Harriett Coleman", image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.1.jpg', fev: false, time: "12 Hours ago", rating: 3, like: 1, msg: "i will join it now"));
  return list;
}

List<EATicketModel> ticketList = [
  EATicketModel(name: "Normal Ticket", time: "4:30 until 6:30", payment: "Sold Out", count: 0),
  EATicketModel(name: "VIP Ticket", time: "6:30 until 7:30", payment: "*\$80=\$0", count: 0),
  EATicketModel(name: "Normal Ticket", time: "4:30 until 6:30", payment: "*\$80=\$0", count: 0),
  EATicketModel(name: "VIP Ticket", time: "6:30 until 7:30", payment: "*\$80=\$160", count: 2),
];

List<EACityModel> cardList = [
  EACityModel(image: event_ic_visa),
  EACityModel(image: event_ic_master),
  EACityModel(image: event_ic_amex),
];

List<EAInboxModel> inboxList = [
  EAInboxModel(msg: "Fashion finest AW17 During London Fashion Week", image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.9.jpg', name: "jose Lowe"),
  EAInboxModel(msg: "Bike New York For Bike Month", image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.1.jpg', name: "Smit Jhon"),
  EAInboxModel(msg: "Washington Square Outdoor Art Exhibit", image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.2.jpg', name: "Louisa Lyons"),
  EAInboxModel(msg: "Why Las vegas hotal Room For you", image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.3.jpg', name: "Hulda James"),
  EAInboxModel(msg: "Bike New York For Bike Month", image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.4.jpg', name: "Bessie Mendoza"),
  EAInboxModel(msg: "Washington Square Outdoor Art Exhibit", image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.9.jpg', name: "Matilda MCGuire"),
  EAInboxModel(msg: "Why Las vegas hotal Room For you", image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.1.jpg', name: "Harriett Coleman"),
  EAInboxModel(msg: "Fashion finest AW17 During London Fashion Week", image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.9.jpg', name: "jose Lowe"),
  EAInboxModel(msg: "Bike New York For Bike Month", image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.1.jpg', name: "Smit Jhon"),
  EAInboxModel(msg: "Washington Square Outdoor Art Exhibit", image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.2.jpg', name: "Louisa Lyons"),
  EAInboxModel(msg: "Why Las vegas hotal Room For you", image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.3.jpg', name: "Hulda James"),
  EAInboxModel(msg: "Bike New York For Bike Month", image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.4.jpg', name: "Bessie Mendoza"),
  EAInboxModel(msg: "Washington Square Outdoor Art Exhibit", image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.9.jpg', name: "Matilda MCGuire"),
  EAInboxModel(msg: "Why Las vegas hotal Room For you", image: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.1.jpg', name: "Harriett Coleman"),
];

List<EAActivityModel> activityList = [
  EAActivityModel(name: "Bottled Art wine painting night", image: event_ic_music, icon: Icons.login_outlined, subtitle: "joined the list", time: "10 min ago", subtime: "sun mar,25 - 4.30 pm est"),
  EAActivityModel(name: "Emc Black ticket", image: event_ic_walk_through1, icon: Icons.shopping_cart_outlined, subtitle: "Brought ticket", time: "mar 26,2018", subtime: "sun mar,25 - 4.30 pm est"),
  EAActivityModel(name: "win 2 tickets to WWE @MSC", image: event_ic_festival, icon: Icons.shopping_cart_outlined, subtitle: "Brought ticket", time: "10 min ago", subtime: "sun mar,25 - 4.30 pm est"),
  EAActivityModel(name: "Bottled Art wine painting night", image: event_ic_cinema, icon: Icons.login_outlined, subtitle: "joined the list", time: "10 min ago", subtime: "sun mar,25 - 4.30 pm est"),
  EAActivityModel(name: "Emc Black ticket", image: event_ic_tokyo, icon: Icons.login_outlined, subtitle: "joined the list", time: "10 min ago", subtime: "sun mar,25 - 4.30 pm est"),
  EAActivityModel(name: "win 2 tickets to WWE @MSC", image: event_ic_paris, icon: Icons.login_outlined, subtitle: "joined the list", time: "10 min ago", subtime: "sun mar,25 - 4.30 pm est"),
  EAActivityModel(name: "Bottled Art wine painting night", image: event_ic_music, icon: Icons.login_outlined, subtitle: "joined the list", time: "10 min ago", subtime: "sun mar,25 - 4.30 pm est"),
];

List<EAActivityModel> notificationList = [
  EAActivityModel(name: "Sandra minalo", image: event_ic_music, time: "send you message", subtime: "sun mar,25 - 4.30 pm est", subtitle: "joined the list"),
  EAActivityModel(name: "Linnie Lyons", image: event_ic_walk_through1, time: "send you message", subtime: "sun mar,25 - 4.30 pm est", subtitle: " Brought ticket"),
  EAActivityModel(name: "innie Lyons", image: event_ic_festival, time: "send you message", subtime: "sun mar,25 - 4.30 pm est", subtitle: "joined the list"),
  EAActivityModel(name: "Sandra minalo", image: event_ic_cinema, time: "send you message", subtime: "sun mar,25 - 4.30 pm est", subtitle: " Brought ticket"),
  EAActivityModel(name: "Linnie Lyons", image: event_ic_tokyo, time: "send you message", subtime: "sun mar,25 - 4.30 pm est", subtitle: "joined the list"),
  EAActivityModel(name: "Sandra minalo", image: event_ic_paris, time: "send you message", subtime: "sun mar,25 - 4.30 pm est", subtitle: " Brought ticket"),
  EAActivityModel(name: "Linnie Lyons", image: event_ic_music, time: "send you message", subtime: "sun mar,25 - 4.30 pm est", subtitle: "oined the list"),
];

List<EAActivityModel> imageList = [
 
 ];
