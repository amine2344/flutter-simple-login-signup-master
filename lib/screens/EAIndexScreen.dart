import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:loginSignup/model/EAInboxModel.dart';
import 'package:loginSignup/utils/EADataProvider.dart';
import 'package:loginSignup/utils/EAapp_widgets.dart';

class EAIndexScreen extends StatefulWidget {
  const EAIndexScreen({super.key});

  @override
  _EAIndexScreenState createState() => _EAIndexScreenState();
}

class _EAIndexScreenState extends State<EAIndexScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        "Index",
        center: true,
        backWidget: IconButton(
          onPressed: () {
            finish(context);
          },
          icon: const Icon(Icons.arrow_back, color: white),
        ),
      ),
      body: ListView.separated(
        separatorBuilder:(BuildContext context, int index){
          return const Divider();
        } ,
        padding: const EdgeInsets.all(8),
        shrinkWrap: true,
        itemCount: inboxList.length,
        itemBuilder: (BuildContext context, int index) {
          EAInboxModel data = inboxList[index];
          return Container(
            margin: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                commonCachedNetworkImage(
                  data.image,
                  fit: BoxFit.cover,
                  height: 60,
                  width: 60,
                ).cornerRadiusWithClipRRect(35),
                16.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.name!, style: boldTextStyle()),
                    4.height,
                    Text(data.msg!, style: secondaryTextStyle()),
                  ],
                ).expand(),
              ],
            ),
          ).onTap(() {

          });
        },
      ),
    );
  }
}
