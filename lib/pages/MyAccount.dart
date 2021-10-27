import 'package:flutter/material.dart';
import 'package:gobat_app/models/User.dart';
import 'package:gobat_app/widgets/SubProfileContainer.dart';
import 'package:provider/provider.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return SubProfileContainer(
      context: context,
      title: "Akun Saya",
      child: Container(
        child: Center(
          child: Text(user.fullname),
        ),
      ),
      makeClearFocus: true,
    );
  }
}
