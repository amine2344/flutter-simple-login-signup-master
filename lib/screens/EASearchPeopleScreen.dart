import 'package:loginSignup/model/EAForYouModel.dart';
import 'package:loginSignup/utils/EAColors.dart';
import 'package:loginSignup/utils/EADataProvider.dart';
import 'package:loginSignup/utils/EAapp_widgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class EASearchPeopleScreen extends StatefulWidget {
  const EASearchPeopleScreen({super.key});

  @override
  EASearchPeopleScreenState createState() => EASearchPeopleScreenState();
}

class EASearchPeopleScreenState extends State<EASearchPeopleScreen> {
  TextEditingController searchController = TextEditingController();

  List<EAForYouModel> list = getMayKnowData();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        'Search People',
        backWidget: IconButton(
            onPressed: () {
              finish(context);
            },
            icon: const Icon(Icons.arrow_back, color: white)),
        center: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 50,
              decoration: boxDecorationWithShadow(backgroundColor: white, shadowColor: grey.withOpacity(0.3)),
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                controller: searchController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.search, size: 24, color: black),
                  suffixIcon: const Icon(Icons.close, size: 24, color: primaryColor1).onTap(
                    () {
                      searchController.clear();
                    },
                  ),
                ),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                EAForYouModel data = list[index];
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
                          Text(data.add!, style: secondaryTextStyle()),
                        ],
                      ).expand(),
                      IconButton(
                        onPressed: () {
                          data.fev = !data.fev!;
                          setState(() {});
                        },
                        icon: data.fev! ? Icon(Icons.person_remove, color: data.fev! ? primaryColor1 : black) : Icon(Icons.person_add_alt_1, color: data.fev! ? primaryColor1 : black),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
