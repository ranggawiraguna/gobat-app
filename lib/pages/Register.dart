// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gobat_app/models/User.dart';
import 'package:gobat_app/pages/Login.dart';
import 'package:gobat_app/services/FirestoreService.dart';
import 'package:gobat_app/services/NavigatorServices.dart';
import 'package:gobat_app/widgets/AlertNotification.dart';
import 'package:gobat_app/widgets/DefaultTextField.dart';
import 'package:gobat_app/widgets/FlexSpace.dart';
import 'package:gobat_app/widgets/RatioButtonRounded.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController usernameController = TextEditingController(),
      passwordController = TextEditingController(),
      fullnameController = TextEditingController(),
      emailController = TextEditingController();

  late bool _usernameNotAvailable, _emailIncorrect, _passwordIncorrect;

  late String? _passwordStrength;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF000000),
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ));

    _usernameNotAvailable = false;
    _emailIncorrect = false;
    _passwordIncorrect = false;
    _passwordStrength = null;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<User> users = (Provider.of<List<User>>(context));

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: AspectRatio(
                            aspectRatio: 1080 / 682,
                            child: SvgPicture.asset(
                                "assets/Decoration_RegisterTop.svg"),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: AspectRatio(
                            aspectRatio: 1080 / 522,
                            child: SvgPicture.asset(
                                "assets/Decoration_RegisterBottom.svg"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top),
                  child: Container(
                    child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Row(
                          children: [
                            FlexSpace(100),
                            Flexible(
                              flex: 880,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(child: Container()),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        FlexSpace(106),
                                        Flexible(
                                            flex: 668,
                                            child: AspectRatio(
                                              aspectRatio: 668 / 199,
                                              child: Image.asset(
                                                  "assets/AppIcon_2.png"),
                                            )),
                                        FlexSpace(106),
                                      ],
                                    ),
                                  ),
                                  AspectRatio(aspectRatio: 880 / 75),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        FlexSpace(36),
                                        Flexible(
                                          flex: 808,
                                          child: AutoSizeText(
                                            "Daftarkan akun Anda untuk dapat melanjutkan",
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontSize: 100,
                                              fontFamily: "Folks",
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        FlexSpace(36),
                                      ],
                                    ),
                                  ),
                                  AspectRatio(aspectRatio: 880 / 100),
                                  DefaultTextField(
                                    label: "Username",
                                    controller: usernameController,
                                    textInputType: TextInputType.name,
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    errorText: (_usernameNotAvailable &&
                                            usernameController.text.length > 0)
                                        ? ((usernameController.text.length >=
                                                    4 &&
                                                usernameController.text ==
                                                    usernameController.text
                                                        .toLowerCase())
                                            ? "Username yang dimasukkan sudah digunakan"
                                            : "Username memiliki minimal 4 karakter dan huruf kecil")
                                        : null,
                                    onChanged: (text) {
                                      setState((() =>
                                          _usernameNotAvailable = false));
                                      users.forEach((element) {
                                        if (text == element.username ||
                                            text.length < 4 ||
                                            text != text.toLowerCase()) {
                                          setState((() =>
                                              _usernameNotAvailable = true));
                                        }
                                      });
                                    },
                                  ),
                                  AspectRatio(aspectRatio: 880 / 50),
                                  DefaultTextField(
                                      label: "Password",
                                      controller: passwordController,
                                      textInputType: TextInputType.name,
                                      textInputAction: TextInputAction.done,
                                      obscureText: false,
                                      errorText: _passwordIncorrect
                                          ? "Password tidak sesuai persyaratan"
                                          : null,
                                      iconSuffix: IconButton(
                                        icon: Icon(Icons.info,
                                            color: Color(0x80000000)),
                                        onPressed: () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(
                                                'Password harus terdiri dari minimal 8 karakter, diawali dengan huruf besar dan mengandung campuran angka'),
                                          ));
                                        },
                                      ),
                                      onChanged: (text) {
                                        setState(() {
                                          _passwordIncorrect = false;
                                        });
                                        if (text.length > 0) {
                                          if ((text.substring(0, 1) ==
                                                  text
                                                      .substring(0, 1)
                                                      .toUpperCase()) &&
                                              (text.contains(
                                                  new RegExp(r'[0-9]'))) &&
                                              (text.length >= 8)) {
                                            setState((() =>
                                                _passwordStrength = "Kuat"));
                                          } else if (((text[0] ==
                                                      text[0].toUpperCase()) &&
                                                  (((text.contains(new RegExp(
                                                              '(?:[^a-z]*[a-z])'))) &&
                                                          (text.contains(
                                                              new RegExp(
                                                                  r'[0-9]')))) ||
                                                      (text.length >= 8))) ||
                                              ((text.contains(
                                                      new RegExp(r'[0-9]'))) &&
                                                  (text.length >= 8))) {
                                            setState((() =>
                                                _passwordStrength = "Sedang"));
                                          } else if ((text.substring(0, 1) ==
                                                  text
                                                      .substring(0, 1)
                                                      .toUpperCase()) ||
                                              ((text.contains(new RegExp(
                                                      '(?:[^a-z]*[a-z])'))) &&
                                                  (text.contains(
                                                      new RegExp(r'[0-9]')))) ||
                                              (text.length >= 8)) {
                                            setState((() =>
                                                _passwordStrength = "Lemah"));
                                          } else {
                                            setState((() {
                                              _passwordStrength = null;
                                              _passwordIncorrect = true;
                                            }));
                                          }
                                        } else {
                                          setState(
                                              (() => _passwordStrength = null));
                                        }
                                      }),
                                  AnimatedSwitcher(
                                      duration: Duration(milliseconds: 0),
                                      transitionBuilder: (Widget child,
                                          Animation<double> animation) {
                                        return FadeTransition(
                                            child: child, opacity: animation);
                                      },
                                      child: _passwordStrength == null
                                          ? Container(
                                              key: ValueKey<int>(0),
                                              width: 0,
                                              height: 0)
                                          : AspectRatio(
                                              key: ValueKey<int>(1),
                                              aspectRatio: 880 / 16)),
                                  AnimatedSwitcher(
                                    duration: Duration(milliseconds: 0),
                                    transitionBuilder: (Widget child,
                                        Animation<double> animation) {
                                      return FadeTransition(
                                          child: child, opacity: animation);
                                    },
                                    child: _passwordStrength == null
                                        ? Container(
                                            key: ValueKey<int>(0),
                                            width: 0,
                                            height: 0)
                                        : SizedBox(
                                            key: ValueKey<int>(1),
                                            width: double.infinity,
                                            child: AspectRatio(
                                              aspectRatio: 880 / 41,
                                              child: Row(
                                                children: [
                                                  FlexSpace(30),
                                                  AspectRatio(
                                                    aspectRatio: 820 / 41,
                                                    child: Row(
                                                      children: [
                                                        AutoSizeText(
                                                          _passwordStrength ??
                                                              "",
                                                          maxLines: 1,
                                                          minFontSize: 1,
                                                          style: TextStyle(
                                                            fontSize: 100,
                                                            fontFamily: 'Folks',
                                                            color: getColorStrength(
                                                                _passwordStrength),
                                                          ),
                                                        ),
                                                        FlexSpace(586),
                                                        Flexible(
                                                          flex: 140,
                                                          child: Column(
                                                            children: [
                                                              FlexSpace(15),
                                                              Flexible(
                                                                  flex: 13,
                                                                  child: Row(
                                                                    children: [
                                                                      Flexible(
                                                                          flex:
                                                                              40,
                                                                          child:
                                                                              Container(decoration: BoxDecoration(color: getColorStrength(_passwordStrength), shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(1000))))),
                                                                      FlexSpace(
                                                                          5),
                                                                      Flexible(
                                                                          flex:
                                                                              40,
                                                                          child:
                                                                              Container(decoration: BoxDecoration(color: getColorStrength(((_passwordStrength == "Sedang") || (_passwordStrength == "Kuat")) ? _passwordStrength : null), shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(1000))))),
                                                                      FlexSpace(
                                                                          5),
                                                                      Flexible(
                                                                          flex:
                                                                              40,
                                                                          child:
                                                                              Container(decoration: BoxDecoration(color: getColorStrength((_passwordStrength == "Kuat") ? _passwordStrength : null), shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(1000))))),
                                                                    ],
                                                                  )),
                                                              FlexSpace(14),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  FlexSpace(30),
                                                ],
                                              ),
                                            ),
                                          ),
                                  ),
                                  AspectRatio(aspectRatio: 880 / 50),
                                  DefaultTextField(
                                    label: "Nama Lengkap",
                                    controller: fullnameController,
                                    textInputType: TextInputType.name,
                                    textInputAction: TextInputAction.done,
                                    obscureText: false,
                                  ),
                                  AspectRatio(aspectRatio: 880 / 50),
                                  DefaultTextField(
                                      label: "Email",
                                      controller: emailController,
                                      textInputType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.done,
                                      obscureText: false,
                                      errorText: _emailIncorrect
                                          ? "Email tidak sesuai persyaratan"
                                          : null,
                                      iconSuffix: IconButton(
                                        icon: Icon(Icons.info,
                                            color: Color(0x80000000)),
                                        onPressed: () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(
                                                'Email yang dimasukkan harus menggunakan akun google (Gmail)'),
                                          ));
                                        },
                                      ),
                                      onChanged: (text) {
                                        setState(() {
                                          _emailIncorrect = false;
                                        });
                                      }),
                                  AspectRatio(aspectRatio: 880 / 100),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        FlexSpace(90),
                                        Flexible(
                                          flex: 700,
                                          child: RatioButtonRounded(
                                            aspectRatio: 700 / 140,
                                            innerSpaceVertical: 30,
                                            innerSpaceHorizontal: 253,
                                            flexTextHeight: 79,
                                            flexTextWidth: 194,
                                            textContent: "Daftar",
                                            textColor: Colors.white,
                                            buttonColor: Color(0xFFFF583C),
                                            action: () {
                                              if (!_usernameNotAvailable &&
                                                  _passwordStrength == "Kuat" &&
                                                  (emailController.text
                                                          .substring(
                                                              (emailController
                                                                      .text
                                                                      .length) -
                                                                  10,
                                                              emailController
                                                                  .text
                                                                  .length) ==
                                                      "@gmail.com")) {
                                                FirestoreService()
                                                    .addUser(User.newUser(
                                                  username:
                                                      usernameController.text,
                                                  password:
                                                      passwordController.text,
                                                  fullname:
                                                      fullnameController.text,
                                                  email: emailController.text,
                                                ));

                                                AlertNotification(
                                                    context: context,
                                                    backgroundColor:
                                                        Color(0xFF43A047),
                                                    aspectRatio: 951 / 95,
                                                    widthPercent: 0.88,
                                                    iconPath:
                                                        "assets/Icon_ChecklistSnackbar.svg",
                                                    textContent:
                                                        "Berhasil daftar, silahkan masuk untuk mengakses aplikasi",
                                                    flexContentVertical: 38,
                                                    flexIconHorizontal: 35,
                                                    flexTextHorizontal: 826,
                                                    textMaxLines: 1,
                                                    duration: 3000,
                                                    nextAction: () {
                                                      Timer(
                                                          Duration(
                                                            milliseconds: 3000,
                                                          ), () {
                                                        Navigator.of(context)
                                                            .push(
                                                          NavigatorSlide(
                                                              child: StreamProvider<
                                                                  List<
                                                                      User>>.value(
                                                                value:
                                                                    FirestoreService()
                                                                        .users,
                                                                initialData: [],
                                                                child: Login(),
                                                              ),
                                                              direction:
                                                                  AxisDirection
                                                                      .left),
                                                        );

                                                        usernameController
                                                            .clear();
                                                        passwordController
                                                            .clear();
                                                        fullnameController
                                                            .clear();
                                                        emailController.clear();

                                                        setState(() {
                                                          _usernameNotAvailable =
                                                              false;
                                                          _passwordStrength =
                                                              null;
                                                        });
                                                      });
                                                    });
                                              } else {
                                                AlertNotification(
                                                  context: context,
                                                  backgroundColor:
                                                      Color(0xFFFFA000),
                                                  aspectRatio: 884 / 95,
                                                  widthPercent: 0.82,
                                                  iconPath:
                                                      "assets/Icon_WarningSnackbar.svg",
                                                  textContent:
                                                      "Silakan masukkan formulir pendaftaran dengan benar",
                                                  flexContentVertical: 38,
                                                  flexIconHorizontal: 35,
                                                  flexTextHorizontal: 769,
                                                  textMaxLines: 1,
                                                  duration: 3000,
                                                );

                                                if (!(emailController.text
                                                        .substring(
                                                            (emailController
                                                                    .text
                                                                    .length) -
                                                                10,
                                                            emailController
                                                                .text.length) ==
                                                    "@gmail.com")) {
                                                  setState(() {
                                                    _emailIncorrect = true;
                                                  });
                                                }

                                                if (_passwordStrength !=
                                                    "Kuat") {
                                                  setState(() {
                                                    _passwordIncorrect = true;
                                                  });
                                                }
                                              }
                                            },
                                          ),
                                        ),
                                        FlexSpace(90),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              FlexSpace(131),
                                              Flexible(
                                                flex: 618,
                                                child: AspectRatio(
                                                  aspectRatio: 618 / 50,
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    child: Row(
                                                      children: [
                                                        Flexible(
                                                            flex: 325,
                                                            child: Column(
                                                              children: [
                                                                FlexSpace(6),
                                                                Flexible(
                                                                  flex: 44,
                                                                  child: AutoSizeText(
                                                                      "Sudah memiliki akun ?",
                                                                      maxLines:
                                                                          1,
                                                                      minFontSize:
                                                                          1,
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            100,
                                                                        fontFamily:
                                                                            "Folks",
                                                                        color: Colors
                                                                            .white,
                                                                      )),
                                                                ),
                                                              ],
                                                            )),
                                                        FlexSpace(18),
                                                        Flexible(
                                                          flex: 275,
                                                          child: TextButton(
                                                            child: AutoSizeText(
                                                              "Masuk Sekarang",
                                                              maxLines: 1,
                                                              minFontSize: 1,
                                                              style: TextStyle(
                                                                fontSize: 100,
                                                                fontFamily:
                                                                    "Folks",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Color(
                                                                    0xFF2196F3),
                                                              ),
                                                            ),
                                                            style: TextButton
                                                                .styleFrom(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(0),
                                                            ),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .push(
                                                                NavigatorSlide(
                                                                  child: StreamProvider<
                                                                      List<
                                                                          User>>.value(
                                                                    value: FirestoreService()
                                                                        .users,
                                                                    initialData: [],
                                                                    child:
                                                                        Login(),
                                                                  ),
                                                                  direction:
                                                                      AxisDirection
                                                                          .left,
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              FlexSpace(131),
                                            ],
                                          ),
                                          AspectRatio(aspectRatio: 880 / 75),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            FlexSpace(100)
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

Color getColorStrength(String? strength) {
  Color color = Color(0x33000000);

  if (strength != null) {
    switch (strength) {
      case "Lemah":
        color = Color(0xFFD32F2F);
        break;

      case "Sedang":
        color = Color(0xFFF3AC21);
        break;

      case "Kuat":
        color = Color(0xFF43A047);
        break;
    }
  }

  return color;
}
