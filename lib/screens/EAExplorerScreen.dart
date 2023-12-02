import 'package:loginSignup/model/EAForYouModel.dart';
import 'package:loginSignup/screens/PurchaseMoreScreen.dart';
import 'package:loginSignup/utils/EADataProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EAExplorerScreen extends StatefulWidget {
  const EAExplorerScreen({super.key});

  @override
  EAExplorerScreenState createState() => EAExplorerScreenState();
}

class EAExplorerScreenState extends State<EAExplorerScreen> {
  List<EAForYouModel> explorerList = getMayKnowData();

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
    return const PurchaseMoreScreen();
  }
}
