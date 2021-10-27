import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gobat_app/models/User.dart';
import 'package:gobat_app/pages/Login.dart';
import 'package:gobat_app/services/AccountSessionManager.dart';
import 'package:gobat_app/services/FirestoreService.dart';
import 'package:gobat_app/services/NavigatorServices.dart';
import 'package:provider/provider.dart';

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
            AccountSessionManager().removeActiveUser(otherAction: () {
              Navigator.of(context).pushAndRemoveUntil(
                  NavigatorScale(
                    child: StreamProvider<List<User>>.value(
                      value: FirestoreService().users,
                      initialData: [],
                      child: Login(),
                    ),
                  ),
                  (Route<dynamic> route) => false);
            });
          },
        ),
      ),
    );
  }
}
