// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gobat_app/pages/Login.dart';
import 'package:gobat_app/widgets/DefaultTextField.dart';
import 'package:gobat_app/widgets/FlexSpace.dart';
import 'package:gobat_app/widgets/RatioButtonRounded.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController usernameController = TextEditingController(),
      passwordController = TextEditingController(),
      nameController = TextEditingController(),
      emailController = TextEditingController();

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
                                  controller: emailController,
                                  textInputType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                ),
                                AspectRatio(aspectRatio: 880 / 50),
                                DefaultTextField(
                                  label: "Password",
                                  controller: passwordController,
                                  textInputType: TextInputType.name,
                                  textInputAction: TextInputAction.done,
                                  obscureText: false,
                                ),
                                AspectRatio(aspectRatio: 880 / 50),
                                DefaultTextField(
                                  label: "Nama Lengkap",
                                  controller: nameController,
                                  textInputType: TextInputType.name,
                                  textInputAction: TextInputAction.done,
                                  obscureText: false,
                                ),
                                AspectRatio(aspectRatio: 880 / 50),
                                DefaultTextField(
                                  label: "Email",
                                  controller: emailController,
                                  textInputType: TextInputType.name,
                                  textInputAction: TextInputAction.done,
                                  obscureText: false,
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
                                          textContent: "Daftar",
                                          textColor: Colors.white,
                                          buttonColor: Colors.black,
                                          action: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Login(),
                                              ),
                                            );
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
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            FlexSpace(131),
                                            Flexible(
                                              flex: 618,
                                              child: AspectRatio(
                                                aspectRatio: 618 / 44,
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  child: Row(
                                                    children: [
                                                      Flexible(
                                                          flex: 325,
                                                          child: AutoSizeText(
                                                              "Sudah memiliki akun ?",
                                                              maxLines: 1,
                                                              minFontSize: 1,
                                                              style: TextStyle(
                                                                fontSize: 100,
                                                                fontFamily:
                                                                    "Folks",
                                                                color: Colors
                                                                    .black,
                                                              ))),
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
                                                                        Login(),
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
