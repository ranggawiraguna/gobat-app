import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gobat_app/pages/Login.dart';
import 'package:gobat_app/services/AccountSessionManager.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          child: Text("Keluar"),
          onPressed: () {
            AccountSessionManager().logoutThisUser().whenComplete(() {
              Navigator.of(context).pushAndRemoveUntil(
                  new MaterialPageRoute(
                      builder: (BuildContext context) => Login()),
                  (Route<dynamic> route) => false);
            });
          },
        ),
      ),
    );
  }
}
