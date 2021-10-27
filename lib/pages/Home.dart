import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gobat_app/models/User.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return Container(child: Center(child: Text(user.fullname)));
  }
}
