import 'package:loginSignup/model/EAForYouModel.dart';
import 'package:loginSignup/utils/EAConstants.dart';
import 'package:loginSignup/utils/EADataProvider.dart';
import 'package:loginSignup/utils/EAapp_widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

class EAChattingScreen extends StatefulWidget {
  // final String? img;
  final String? name;

  const EAChattingScreen({super.key, this.name});

  @override
  EAChattingScreenState createState() => EAChattingScreenState();
}

class EAChattingScreenState extends State<EAChattingScreen> {
  ScrollController scrollController = ScrollController();
  TextEditingController msgController = TextEditingController();
  FocusNode msgFocusNode = FocusNode();
  var msgListing = getChatMsgData();
  var personName = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  sendClick() async {
    DateFormat formatter = DateFormat('hh:mm a');

    if (msgController.text.trim().isNotEmpty) {
      hideKeyboard(context);
      var msgModel = EAMessageModel();
      msgModel.msg = msgController.text.toString();
      msgModel.time = formatter.format(DateTime.now());
      msgModel.senderId = EASender_id;
      hideKeyboard(context);
      msgListing.insert(0, msgModel);

      var msgModel1 = EAMessageModel();
      msgModel1.msg = msgController.text.toString();
      msgModel1.time = formatter.format(DateTime.now());
      msgModel1.senderId = EAReceiver_id;

      msgController.text = '';

      if (mounted) scrollController.animToTop();
      FocusScope.of(context).requestFocus(msgFocusNode);
      setState(() {});

      await Future.delayed(const Duration(seconds: 1));

      msgListing.insert(0, msgModel1);

      if (mounted) scrollController.animToTop();
    } else {
      FocusScope.of(context).requestFocus(msgFocusNode);
    }

    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        widget.name!,
        backWidget: IconButton(
            onPressed: () {
              finish(context);
            },
            icon: const Icon(Icons.arrow_back, color: white)),
        center: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search, color: white))],
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
            decoration: const BoxDecoration(color: white),
            child: ListView.separated(
              separatorBuilder: (_, i) => const Divider(color: Colors.transparent),
              shrinkWrap: true,
              reverse: true,
              controller: scrollController,
              itemCount: msgListing.length,
              padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 70),
              itemBuilder: (_, index) {
                EAMessageModel data = msgListing[index];
                var isMe = data.senderId == EASender_id;

                return ChatMessageWidget1(isMe: isMe, data: data);
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
              decoration: BoxDecoration(color: white, boxShadow: defaultBoxShadow()),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: msgController,
                    focusNode: msgFocusNode,
                    autofocus: true,
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration.collapsed(
                      hintText: personName.isNotEmpty ? 'Write to ${widget.name}' : 'Type a message',
                      hintStyle: primaryTextStyle(),
                    ),
                    style: primaryTextStyle(),
                    onSubmitted: (s) {
                      sendClick();
                    },
                  ).expand(),
                  IconButton(
                    icon: const Icon(Icons.send, size: 25),
                    onPressed: () async {
                      sendClick();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
