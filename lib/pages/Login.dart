import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gobat_app/pages/Main.dart';
import 'package:gobat_app/widgets/DefaultTextField.dart';
import 'package:gobat_app/widgets/FlexSpace.dart';
import 'package:gobat_app/widgets/RatioButtonRounded.dart';

import 'Register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController usernameController = TextEditingController(),
      passwordController = TextEditingController();
  bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
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
                                  aspectRatio: 880 / 133,
                                  label: "Username",
                                  controller: usernameController,
                                  textInputType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                ),
                                AspectRatio(aspectRatio: 880 / 50),
                                DefaultTextField(
                                  aspectRatio: 880 / 133,
                                  label: "Password",
                                  controller: passwordController,
                                  textInputType: TextInputType.name,
                                  textInputAction: TextInputAction.done,
                                  obscureText: !_passwordVisible,
                                  iconSuffix: IconButton(
                                    icon: Icon(
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                ),
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
                                          buttonColor: Colors.black,
                                          action: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Main(),
                                              ),
                                            );
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
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF0000FF),
                                                ),
                                              ),
                                              style: TextButton.styleFrom(
                                                padding: EdgeInsets.all(0),
                                              ),
                                              onPressed: () {},
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
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            FlexSpace(131),
                                            Flexible(
                                              flex: 616,
                                              child: AspectRatio(
                                                aspectRatio: 618 / 44,
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  child: Row(
                                                    children: [
                                                      Flexible(
                                                        flex: 323,
                                                        child: AutoSizeText(
                                                          "Belum memiliki akun ?",
                                                          maxLines: 1,
                                                          minFontSize: 1,
                                                          style: TextStyle(
                                                            fontSize: 100,
                                                            fontFamily: "Folks",
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      FlexSpace(19),
                                                      Flexible(
                                                        flex: 274,
                                                        child: TextButton(
                                                          child: AutoSizeText(
                                                            "Daftar Sekarang",
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
                                                                  0xFF0000FF),
                                                            ),
                                                          ),
                                                          style: TextButton
                                                              .styleFrom(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    0),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        Register(),
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
    );
  }
}
