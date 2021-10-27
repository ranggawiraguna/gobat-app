import 'package:flutter/material.dart';
import 'package:gobat_app/models/Article.dart';
import 'package:gobat_app/models/Product.dart';
import 'package:gobat_app/models/User.dart';
import 'package:gobat_app/services/AccountSessionManager.dart';
import 'package:gobat_app/services/FirestoreService.dart';
import 'package:gobat_app/widgets/SubProfileContainer.dart';
import 'package:provider/provider.dart';

class ActivityHistory extends StatefulWidget {
  @override
  _ActivityHistoryState createState() => _ActivityHistoryState();
}

class _ActivityHistoryState extends State<ActivityHistory> {
  String? _userId;

  @override
  void initState() {
    AccountSessionManager()
        .isUserLoggedIn()
        .then((value) => AccountSessionManager().getActiveUserId().then(
              (value) => setState(() => _userId = value),
            ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User?>.value(
            value: FirestoreService().user(_userId ?? ""),
            initialData: User.empty),
        StreamProvider<List<Product>>.value(
            value: FirestoreService().products, initialData: []),
        StreamProvider<List<Article>>.value(
            value: FirestoreService().articles, initialData: []),
      ],
      child: SubProfileContainer(
        context: context,
        title: "Riwayat Aktivitas",
        child: Container(),
        makeClearFocus: false,
      ),
    );
  }
}
