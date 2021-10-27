import 'package:flutter/material.dart';
import 'package:gobat_app/models/User.dart';
import 'package:gobat_app/widgets/SubProfileContainer.dart';
import 'package:provider/provider.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return SubProfileContainer(
      context: context,
      title: "Ubah Password",
      child: Container(
        child: Center(
          child: Text(user.fullname),
        ),
      ),
      makeClearFocus: true,
    );
  }
}
