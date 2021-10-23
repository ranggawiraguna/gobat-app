import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gobat_app/models/User.dart';
import 'package:gobat_app/services/AccountSessionManager.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late User user;

  @override
  void initState() {
    AccountSessionManager()
        .getUserInfo()
        .then((value) => setState(() => user = value));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(""));
  }
}
