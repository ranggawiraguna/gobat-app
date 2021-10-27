// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobat_app/models/User.dart';
import 'package:gobat_app/pages/Main.dart';
import 'package:gobat_app/pages/Register.dart';
import 'package:gobat_app/services/AccountSessionManager.dart';
import 'package:gobat_app/services/FirestoreService.dart';
import 'package:gobat_app/services/NavigatorServices.dart';
import 'package:gobat_app/widgets/AlertNotification.dart';
import 'package:gobat_app/widgets/DefaultTextField.dart';
import 'package:gobat_app/widgets/DefaultTextFieldSingle.dart';
import 'package:gobat_app/widgets/DialogActionContainer.dart';
import 'package:gobat_app/widgets/FlexButton.dart';
import 'package:gobat_app/widgets/FlexSpace.dart';
import 'package:gobat_app/widgets/RatioButtonRounded.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  final TextEditingController usernameController = TextEditingController(),
      usernameController2 = TextEditingController(),
      passwordController = TextEditingController();
  late bool _passwordVisible,
      _invalidUsername,
      _invalidUsername2,
      _invalidPassword,
      _visibleDialogSendPassword,
      _successSendPassword;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF000000),
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ));

    _invalidPassword = _passwordVisible = false;
    _visibleDialogSendPassword = false;
    _invalidUsername = true;
    _invalidUsername2 = true;
    _successSendPassword = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<User> users = (Provider.of<List<User>>(context));

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Container(
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
                                  "assets/Decoration_LoginTop.svg"),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: AspectRatio(
                              aspectRatio: 1080 / 626,
                              child: SvgPicture.asset(
                                  "assets/Decoration_LoginBottom.svg"),
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
                                              "Masukkan akun Anda untuk dapat melanjutkan",
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
                                      errorText: (_invalidUsername &&
                                              usernameController.text.length >
                                                  0)
                                          ? "Username yang dimasukkan tidak terdaftar"
                                          : null,
                                      onChanged: (text) {
                                        setState((() {
                                          _invalidUsername = true;
                                          _invalidPassword = true;
                                        }));
                                        users.forEach((element) {
                                          if (text == element.username) {
                                            setState((() =>
                                                _invalidUsername = false));

                                            if (element.password ==
                                                passwordController.text) {
                                              setState(() =>
                                                  _invalidPassword = false);
                                            }
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
                                        obscureText: !_passwordVisible,
                                        errorText: (_invalidPassword &&
                                                passwordController.text.length >
                                                    0)
                                            ? "Password yang dimasukkan tidak sesuai"
                                            : null,
                                        iconSuffix: IconButton(
                                          icon: Icon(
                                            _passwordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: Theme.of(context)
                                                .primaryColorDark,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _passwordVisible =
                                                  !_passwordVisible;
                                            });
                                          },
                                        ),
                                        onChanged: (text) {
                                          if (!_invalidUsername) {
                                            setState((() =>
                                                _invalidPassword = true));
                                            users.forEach((element) {
                                              if (usernameController.text ==
                                                      element.username &&
                                                  text == element.password) {
                                                setState((() =>
                                                    _invalidPassword = false));
                                              }
                                            });
                                          }
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
                                              textContent: "Masuk",
                                              textColor: Colors.white,
                                              buttonColor: Color(0xFFFF583C),
                                              action: () {
                                                if (!_invalidUsername &&
                                                    !_invalidPassword) {
                                                  AlertNotification(
                                                    context: context,
                                                    backgroundColor:
                                                        Color(0xFF43A047),
                                                    aspectRatio: 792 / 95,
                                                    widthPercent: 0.73,
                                                    iconPath:
                                                        "assets/Icon_ChecklistSnackbar.svg",
                                                    textContent:
                                                        "Berhasil masuk, mohon tunggu beberapa saat!",
                                                    flexContentVertical: 38,
                                                    flexIconHorizontal: 35,
                                                    flexTextHorizontal: 778,
                                                    textMaxLines: 1,
                                                    duration: 3000,
                                                    nextAction: () {
                                                      users.forEach(
                                                          (user) async {
                                                        if (usernameController
                                                                .text ==
                                                            user.username) {
                                                          AccountSessionManager()
                                                              .setActiveUserId(
                                                                  user.id)
                                                              .whenComplete(() {
                                                            Navigator.of(
                                                                    context)
                                                                .pushAndRemoveUntil(
                                                                    NavigatorScale(
                                                                      child:
                                                                          Main(),
                                                                    ),
                                                                    (Route<dynamic>
                                                                            route) =>
                                                                        false);
                                                            usernameController
                                                                .clear();
                                                            passwordController
                                                                .clear();
                                                          });
                                                        }
                                                      });
                                                    },
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                          FlexSpace(90),
                                        ],
                                      ),
                                    ),
                                    AspectRatio(aspectRatio: 880 / 50),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Row(
                                        children: [
                                          FlexSpace(289),
                                          Flexible(
                                            flex: 302,
                                            child: AspectRatio(
                                              aspectRatio: 302 / 44,
                                              child: SizedBox(
                                                width: double.infinity,
                                                height: double.infinity,
                                                child: TextButton(
                                                  child: AutoSizeText(
                                                    "Lupa Password ?",
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                      fontSize: 100,
                                                      fontFamily: "Folks",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xFF0000FF),
                                                    ),
                                                  ),
                                                  style: TextButton.styleFrom(
                                                    padding: EdgeInsets.all(0),
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      _visibleDialogSendPassword =
                                                          true;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          FlexSpace(289),
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
                                                  flex: 616,
                                                  child: AspectRatio(
                                                    aspectRatio: 618 / 50,
                                                    child: SizedBox(
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      child: Row(
                                                        children: [
                                                          Flexible(
                                                            flex: 323,
                                                            child: Column(
                                                              children: [
                                                                FlexSpace(6),
                                                                Flexible(
                                                                  flex: 44,
                                                                  child:
                                                                      AutoSizeText(
                                                                    "Belum memiliki akun ?",
                                                                    maxLines: 1,
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
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          FlexSpace(19),
                                                          Flexible(
                                                            flex: 274,
                                                            child: TextButton(
                                                              child:
                                                                  AutoSizeText(
                                                                "Daftar Sekarang",
                                                                maxLines: 1,
                                                                minFontSize: 1,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 100,
                                                                  fontFamily:
                                                                      "Folks",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Color(
                                                                      0xFF0000FF),
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
                                                                            Register(),
                                                                      ),
                                                                      direction:
                                                                          AxisDirection
                                                                              .right),
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
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 400),
                    child: _visibleDialogSendPassword
                        ? SizedBox(
                            key: ValueKey<int>(1),
                            width: MediaQuery.of(context).size.width,
                            height: (MediaQuery.of(context).size.height -
                                MediaQuery.of(context).padding.top),
                            child: Container(
                              color: Color(0x66000000),
                            ),
                          )
                        : Container(key: ValueKey<int>(0), width: 0, height: 0),
                  ),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return ScaleTransition(child: child, scale: animation);
                    },
                    child: _visibleDialogSendPassword
                        ? AnimatedSwitcher(
                            key: ValueKey<int>(1),
                            duration: Duration(milliseconds: 500),
                            child: !_successSendPassword
                                ? DialogActionContainer(
                                    key: 0,
                                    context: context,
                                    child: Column(
                                      children: [
                                        FlexSpace(100),
                                        Flexible(
                                          flex: 72,
                                          child: Row(
                                            children: [
                                              FlexSpace(156),
                                              Flexible(
                                                flex: 618,
                                                child: Center(
                                                  child: AutoSizeText(
                                                    "Lupa Password Kamu ?",
                                                    textAlign: TextAlign.center,
                                                    minFontSize: 1,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                      fontSize: 100,
                                                      fontFamily: "Folks",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xFF000000),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              FlexSpace(156),
                                            ],
                                          ),
                                        ),
                                        FlexSpace(20),
                                        Flexible(
                                          flex: 100,
                                          child: Row(
                                            children: [
                                              FlexSpace(106),
                                              Flexible(
                                                flex: 718,
                                                child: Center(
                                                  child: AutoSizeText(
                                                    "Masukkan email pendaftaran kamu untuk\nmendapatkan kata sandi yang kamu miliki",
                                                    textAlign: TextAlign.center,
                                                    minFontSize: 1,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                      fontSize: 100,
                                                      fontFamily: "Folks",
                                                      color: Color(0xFF000000),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              FlexSpace(106),
                                            ],
                                          ),
                                        ),
                                        FlexSpace(40),
                                        Flexible(
                                            flex: 620,
                                            child: Center(
                                              child: SvgPicture.asset(
                                                  "assets/Illustration_SendMailSuccess.svg"),
                                            )),
                                        FlexSpace(40),
                                        Flexible(
                                          flex: 136,
                                          child: Row(
                                            children: [
                                              FlexSpace(75),
                                              Flexible(
                                                flex: 780,
                                                child: SizedBox(
                                                  height: double.infinity,
                                                  child: DefaultTextFieldSingle(
                                                    label: "Masukkkan Username",
                                                    controller:
                                                        usernameController2,
                                                    textInputType:
                                                        TextInputType.name,
                                                    textInputAction:
                                                        TextInputAction.done,
                                                    onChanged: (text) {
                                                      setState((() =>
                                                          _invalidUsername2 =
                                                              true));
                                                      users.forEach((element) {
                                                        if (text ==
                                                            element.username) {
                                                          setState((() =>
                                                              _invalidUsername2 =
                                                                  false));
                                                        }
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                              FlexSpace(75),
                                            ],
                                          ),
                                        ),
                                        FlexSpace(42),
                                        Flexible(
                                          flex: 99,
                                          child: Row(
                                            children: [
                                              FlexSpace(75),
                                              FlexButton(
                                                flexButton: 780,
                                                innerSpaceVertical: 20,
                                                innerSpaceHorizontal: 219,
                                                flexTextVertical: 59,
                                                flexTextHorizontal: 342,
                                                textContent: "Kirim Password",
                                                textColor: Colors.white,
                                                buttonColor: Color(0xFFFF583C),
                                                buttonRadius: 6,
                                                action: () {
                                                  if (!_invalidUsername2) {
                                                    for (User user in (Provider
                                                        .of<List<User>>(
                                                            context))) {
                                                      if (user.username ==
                                                          usernameController2
                                                              .text) {
                                                        sendConfirmationPassword(
                                                            user);
                                                        setState(() {
                                                          _successSendPassword =
                                                              true;
                                                        });
                                                      }
                                                    }
                                                  } else if (usernameController2
                                                          .text.length ==
                                                      0) {
                                                    AlertNotification(
                                                      context: context,
                                                      backgroundColor:
                                                          Color(0xFFFFA000),
                                                      aspectRatio: 748 / 95,
                                                      widthPercent: 0.69,
                                                      iconPath:
                                                          "assets/Icon_WarningSnackbar.svg",
                                                      textContent:
                                                          "Silakan masukkan username terlebih dahulu",
                                                      flexContentVertical: 38,
                                                      flexIconHorizontal: 35,
                                                      flexTextHorizontal: 633,
                                                      textMaxLines: 1,
                                                      duration: 3000,
                                                    );
                                                  } else {
                                                    AlertNotification(
                                                      context: context,
                                                      backgroundColor:
                                                          Color(0xFFB00020),
                                                      aspectRatio: 735 / 95,
                                                      widthPercent: 0.68,
                                                      iconPath:
                                                          "assets/Icon_ErrorSnackbar.svg",
                                                      textContent:
                                                          "Username yang dimasukkan tidak terdaftar ",
                                                      flexContentVertical: 38,
                                                      flexIconHorizontal: 35,
                                                      flexTextHorizontal: 620,
                                                      textMaxLines: 1,
                                                      duration: 3000,
                                                    );
                                                  }
                                                },
                                              ),
                                              FlexSpace(75),
                                            ],
                                          ),
                                        ),
                                        FlexSpace(75),
                                      ],
                                    ),
                                    closeAction: () {
                                      setState(() {
                                        _visibleDialogSendPassword = false;
                                        _successSendPassword = false;
                                      });
                                      usernameController2.clear();
                                    })
                                : DialogActionContainer(
                                    key: 1,
                                    context: context,
                                    child: Column(
                                      children: [
                                        FlexSpace(100),
                                        Flexible(
                                          flex: 72,
                                          child: Row(
                                            children: [
                                              FlexSpace(159),
                                              Flexible(
                                                flex: 612,
                                                child: Center(
                                                  child: AutoSizeText(
                                                    "Password Telah Dikirim",
                                                    textAlign: TextAlign.center,
                                                    minFontSize: 1,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                      fontSize: 100,
                                                      fontFamily: "Folks",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xFF000000),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              FlexSpace(159),
                                            ],
                                          ),
                                        ),
                                        FlexSpace(50),
                                        Flexible(
                                            flex: 620,
                                            child: Center(
                                              child: SvgPicture.asset(
                                                  "assets/Illustration_SendMailSuccess.svg"),
                                            )),
                                        FlexSpace(63),
                                        Flexible(
                                          flex: 50,
                                          child: Row(
                                            children: [
                                              FlexSpace(106),
                                              Flexible(
                                                flex: 718,
                                                child: Center(
                                                  child: AutoSizeText(
                                                    "Password kamu telah dikirim melalui email",
                                                    textAlign: TextAlign.center,
                                                    minFontSize: 1,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                      fontSize: 100,
                                                      fontFamily: "Folks",
                                                      color: Color(0xFF000000),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              FlexSpace(106),
                                            ],
                                          ),
                                        ),
                                        FlexSpace(0),
                                        Flexible(
                                          flex: 52,
                                          child: Row(
                                            children: [
                                              FlexSpace(226),
                                              Flexible(
                                                flex: 478,
                                                child: Center(
                                                  child: AutoSizeText(
                                                    (() {
                                                      if (!_invalidUsername2)
                                                        for (User user
                                                            in (Provider.of<
                                                                    List<User>>(
                                                                context)))
                                                          if (user.username ==
                                                              usernameController2
                                                                  .text)
                                                            return user.email;
                                                    })()
                                                        .toString(),
                                                    textAlign: TextAlign.center,
                                                    minFontSize: 1,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                      fontSize: 100,
                                                      fontFamily: "Folks",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xFF000000),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              FlexSpace(226),
                                            ],
                                          ),
                                        ),
                                        FlexSpace(0),
                                        Flexible(
                                          flex: 100,
                                          child: Row(
                                            children: [
                                              FlexSpace(100),
                                              Flexible(
                                                flex: 730,
                                                child: Center(
                                                  child: AutoSizeText(
                                                    "Silahkan periksa email kamu untuk melihat\npassword dari akun yang kamu miiliki",
                                                    textAlign: TextAlign.center,
                                                    minFontSize: 1,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                      fontSize: 100,
                                                      fontFamily: "Folks",
                                                      color: Color(0xFF000000),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              FlexSpace(100),
                                            ],
                                          ),
                                        ),
                                        FlexSpace(63),
                                        Flexible(
                                          flex: 99,
                                          child: Row(
                                            children: [
                                              FlexSpace(75),
                                              FlexButton(
                                                flexButton: 780,
                                                innerSpaceVertical: 20,
                                                innerSpaceHorizontal: 275,
                                                flexTextVertical: 59,
                                                flexTextHorizontal: 230,
                                                textContent: "Lihat Email",
                                                textColor: Colors.white,
                                                buttonColor: Color(0xFFFF583C),
                                                buttonRadius: 6,
                                                action: () async {
                                                  if (!_invalidUsername2) {
                                                    for (User user in (Provider
                                                        .of<List<User>>(
                                                            context))) {
                                                      if (user.username ==
                                                          usernameController2
                                                              .text) {
                                                        await LaunchApp.openApp(
                                                          androidPackageName:
                                                              'com.google.android.gm',
                                                          iosUrlScheme:
                                                              'message://',
                                                        ).catchError((e) async {
                                                          if (Platform.isIOS &&
                                                              await canLaunch(
                                                                  "message://")) {
                                                            await launch(
                                                                "message://");
                                                          } else {
                                                            await launch(
                                                                "https://mail.google.com/mail/u/?authuser=" +
                                                                    user.email);
                                                          }
                                                        });
                                                      }
                                                    }
                                                  }
                                                },
                                              ),
                                              FlexSpace(75),
                                            ],
                                          ),
                                        ),
                                        FlexSpace(75),
                                      ],
                                    ),
                                    closeAction: () {
                                      setState(() {
                                        _visibleDialogSendPassword = false;
                                        _successSendPassword = false;
                                      });
                                      usernameController2.clear();
                                    }),
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              return FadeTransition(
                                child: child,
                                opacity: animation,
                              );
                            },
                          )
                        : Container(key: ValueKey<int>(0), width: 0, height: 0),
                  )
                ],
              ),
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}

Future sendConfirmationPassword(User user) async {
  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");

  // ignore: unused_local_variable
  final response = await http.post(url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json'
      },
      body: json.encode({
        'service_id': 'service_7kdytqd',
        'template_id': 'template_n5dtvbl',
        'user_id': 'user_ZgmXKUfsGzqOrmYDZOnHz',
        'template_params': {
          'user_fullname': user.fullname,
          'user_email': user.email,
          'user_username': user.username,
          'user_password': user.password
        }
      }));
}
