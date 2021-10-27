import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobat_app/models/User.dart';
import 'package:gobat_app/pages/Login.dart';
import 'package:gobat_app/services/AccountSessionManager.dart';
import 'package:gobat_app/services/FirestoreService.dart';
import 'package:gobat_app/services/NavigatorServices.dart';
import 'package:gobat_app/widgets/AlertNotification2_MultiLine.dart';
import 'package:gobat_app/widgets/FlexSpace.dart';
import 'package:gobat_app/widgets/InfoCounterProfile.dart';
import 'package:gobat_app/widgets/MenuItemProfile.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return Container(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1080 / 788,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: AspectRatio(
                      aspectRatio: 1080 / 688,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF404040),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(
                                    MediaQuery.of(context).size.width * 0.138),
                                bottomRight: Radius.circular(
                                    MediaQuery.of(context).size.width *
                                        0.138))),
                        child: Column(
                          children: [
                            FlexSpace(90),
                            Flexible(
                              flex: 310,
                              child: AspectRatio(
                                aspectRatio: 1 / 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          MediaQuery.of(context).size.width *
                                              0.084)),
                                  child: Container(
                                    color: Colors.white,
                                    child: Container(
                                      clipBehavior: Clip.hardEdge,
                                      margin: EdgeInsets.all(
                                          MediaQuery.of(context).size.width *
                                              0.010),
                                      child: SvgPicture.asset(
                                          "assets/Photo_DefaultProfileUser.svg"),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.075)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            FlexSpace(45),
                            Flexible(
                              flex: 83,
                              child: AutoSizeText(
                                user.fullname,
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                minFontSize: 1,
                                style: TextStyle(
                                  overflow: TextOverflow.clip,
                                  fontSize: 100,
                                  fontFamily: "Folks",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            FlexSpace(160),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AspectRatio(
                      aspectRatio: 1080 / 200,
                      child: Row(
                        children: [
                          FlexSpace(270),
                          Flexible(
                              flex: 540,
                              child: SizedBox(
                                height: double.infinity,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFDFDFDF),
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            MediaQuery.of(context).size.width *
                                                0.046)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius:
                                            MediaQuery.of(context).size.width *
                                                0.0231,
                                        offset: Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      InfoCounterProfile("Dilihat", 987),
                                      Flexible(
                                          flex: 5,
                                          child: Column(
                                            children: [
                                              FlexSpace(25),
                                              Flexible(
                                                  flex: 150,
                                                  child: Container(
                                                      color:
                                                          Color(0x32000000))),
                                              FlexSpace(25),
                                            ],
                                          )),
                                      InfoCounterProfile("Disukai", 123),
                                    ],
                                  ),
                                ),
                              )),
                          FlexSpace(270),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            AspectRatio(aspectRatio: 1080 / 75),
            AspectRatio(
              aspectRatio: 1080 / 900,
              child: Row(
                children: [
                  FlexSpace(75),
                  Flexible(
                      flex: 930,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(
                              MediaQuery.of(context).size.width * 0.0926)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius:
                                  MediaQuery.of(context).size.width * 0.0231,
                              offset:
                                  Offset(0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            FlexSpace(100),
                            Flexible(
                                flex: 730,
                                child: Column(
                                  children: [
                                    FlexSpace(100),
                                    Flexible(
                                      flex: 700,
                                      child: Column(
                                        children: [
                                          MenuItemProfile(
                                              "assets/Icon_ProfileAccount.svg",
                                              "Akun Saya",
                                              () {}),
                                          FlexSpace(50),
                                          MenuItemProfile(
                                              "assets/Icon_ProfileLove.svg",
                                              "Favorit Saya",
                                              () {}),
                                          FlexSpace(50),
                                          MenuItemProfile(
                                              "assets/Icon_ProfileHistory.svg",
                                              "Riwayat Aktivitas",
                                              () {}),
                                          FlexSpace(50),
                                          MenuItemProfile(
                                              "assets/Icon_ProfilePassword.svg",
                                              "Ubah Password",
                                              () {}),
                                          FlexSpace(50),
                                          MenuItemProfile(
                                              "assets/Icon_ProfileLogout.svg",
                                              "Keluar Akun", () {
                                            showDialog<String>(
                                              context: context,
                                              builder: (BuildContext
                                                      contextDialog) =>
                                                  AlertDialog(
                                                title: Text('Keluar Akun',
                                                    style: TextStyle(
                                                      fontFamily: "Folks",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                                content: Text(
                                                    'Apakah Anda ingin keluar dari akun ini ?',
                                                    style: TextStyle(
                                                      fontFamily: "Folks",
                                                    )),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            contextDialog,
                                                            'Batal'),
                                                    child: Text('Batal',
                                                        style: TextStyle(
                                                            fontFamily: "Folks",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(
                                                          contextDialog,
                                                          'Keluar');
                                                      AlertNotification2_MultiLine(
                                                          context: context,
                                                          backgroundColor:
                                                              Color(0xFF1976D2),
                                                          aspectRatio:
                                                              880 / 144,
                                                          widthPercent: 0.815,
                                                          textContent:
                                                              "Akun Anda akan keluar, \n terimakasih telah menggunakan aplikasi ini",
                                                          flexContentVertical:
                                                              84,
                                                          flexTextHorizontal:
                                                              820,
                                                          duration: 3000,
                                                          nextAction: () {
                                                            AccountSessionManager()
                                                                .removeActiveUser(
                                                                    otherAction:
                                                                        () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pushAndRemoveUntil(
                                                                      NavigatorSlide(
                                                                          child: StreamProvider<
                                                                              List<
                                                                                  User>>.value(
                                                                            value:
                                                                                FirestoreService().users,
                                                                            initialData: [],
                                                                            child:
                                                                                Login(),
                                                                          ),
                                                                          direction: AxisDirection
                                                                              .up),
                                                                      (Route<dynamic>
                                                                              route) =>
                                                                          false);
                                                            });
                                                          });
                                                    },
                                                    child: Text('Keluar',
                                                        style: TextStyle(
                                                            fontFamily: "Folks",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                        ],
                                      ),
                                    ),
                                    FlexSpace(100),
                                  ],
                                )),
                            FlexSpace(100),
                          ],
                        ),
                      )),
                  FlexSpace(75)
                ],
              ),
            ),
            AspectRatio(aspectRatio: 1080 / 50),
          ],
        ),
      ),
    );
  }
}
