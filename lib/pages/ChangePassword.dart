import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobat_app/models/User.dart';
import 'package:gobat_app/services/FirestoreService.dart';
import 'package:gobat_app/widgets/AlertNotification.dart';
import 'package:gobat_app/widgets/DefaultTextField.dart';
import 'package:gobat_app/widgets/FlexButton.dart';
import 'package:gobat_app/widgets/FlexSpace.dart';
import 'package:gobat_app/widgets/SubProfileContainer.dart';
import 'package:provider/provider.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController passwordController = TextEditingController(),
      passwordController2 = TextEditingController(),
      passwordController3 = TextEditingController();

  late bool _invalidOldPassword, _newPasswordNotMatch;

  @override
  void initState() {
    _invalidOldPassword = false;
    _newPasswordNotMatch = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return SubProfileContainer(
      context: context,
      title: "Ubah Password",
      child: Column(
        children: [
          AspectRatio(aspectRatio: 1080 / 75),
          Row(
            children: [
              FlexSpace(50),
              Flexible(
                flex: 980,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              FlexSpace(50),
                              Flexible(
                                flex: 880,
                                child: Column(
                                  children: [
                                    AspectRatio(aspectRatio: 980 / 50),
                                    AspectRatio(
                                        aspectRatio: 980 / 580,
                                        child: Row(
                                          children: [
                                            FlexSpace(200),
                                            Flexible(
                                                flex: 580,
                                                child: SvgPicture.asset(
                                                    "assets/ChangePassword_Illustration.svg")),
                                            FlexSpace(200),
                                          ],
                                        )),
                                    AspectRatio(aspectRatio: 980 / 50),
                                    AspectRatio(
                                      aspectRatio: 980 / 79,
                                      child: Center(
                                        child: AutoSizeText(
                                          "Buat Password Baru",
                                          textAlign: TextAlign.center,
                                          minFontSize: 1,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 100,
                                            fontFamily: "Folks",
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF000000),
                                          ),
                                        ),
                                      ),
                                    ),
                                    AspectRatio(aspectRatio: 980 / 24),
                                    AspectRatio(
                                      aspectRatio: 980 / 114,
                                      child: Center(
                                        child: AutoSizeText(
                                          "Kata sandi baru kamu harus berbeda dari\nkata sandi yang digunakan sebelumnya",
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
                                    AspectRatio(aspectRatio: 980 / 100),
                                    DefaultTextField(
                                        label: "Password Lama",
                                        controller: passwordController,
                                        textInputType: TextInputType.name,
                                        textInputAction: TextInputAction.next,
                                        errorText: (_invalidOldPassword &&
                                                passwordController
                                                        .text.length !=
                                                    0)
                                            ? "Password yang dimasukkan salah"
                                            : null,
                                        onChanged: (text) {
                                          if (text == user.password) {
                                            setState(() =>
                                                _invalidOldPassword = false);
                                          } else {
                                            setState(() =>
                                                _invalidOldPassword = true);
                                          }
                                        }),
                                    AspectRatio(aspectRatio: 980 / 50),
                                    DefaultTextField(
                                      label: "Password Baru",
                                      controller: passwordController2,
                                      textInputType: TextInputType.name,
                                      textInputAction: TextInputAction.next,
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
                                      errorText: (_newPasswordNotMatch &&
                                              (passwordController2
                                                      .text.length !=
                                                  0) &&
                                              (passwordController3
                                                      .text.length !=
                                                  0))
                                          ? "Password yang dimasukkan tidak sesuai"
                                          : null,
                                      onChanged: (text) {
                                        if (text != passwordController3.text) {
                                          setState(() =>
                                              _newPasswordNotMatch = true);
                                        } else {
                                          setState(() =>
                                              _newPasswordNotMatch = false);
                                        }
                                      },
                                    ),
                                    AspectRatio(aspectRatio: 980 / 50),
                                    DefaultTextField(
                                      label: "Konfirmasi Password Baru",
                                      controller: passwordController3,
                                      textInputType: TextInputType.name,
                                      textInputAction: TextInputAction.done,
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
                                      errorText: (_newPasswordNotMatch &&
                                              (passwordController2
                                                      .text.length !=
                                                  0) &&
                                              (passwordController3
                                                      .text.length !=
                                                  0))
                                          ? "Password yang dimasukkan tidak sesuai"
                                          : null,
                                      onChanged: (text) {
                                        if (text != passwordController2.text) {
                                          setState(() =>
                                              _newPasswordNotMatch = true);
                                        } else {
                                          setState(() =>
                                              _newPasswordNotMatch = false);
                                        }
                                      },
                                    ),
                                    AspectRatio(aspectRatio: 980 / 163.5),
                                  ],
                                ),
                              ),
                              FlexSpace(50),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(
                                MediaQuery.of(context).size.width *
                                    (50 / 1080))),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: (MediaQuery.of(context).size.width *
                                    (25 / 1080)),
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        AspectRatio(aspectRatio: 980 / 63),
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9074,
                        child: AspectRatio(
                          aspectRatio: 1080 / 126,
                          child: Row(
                            children: [
                              FlexSpace(109),
                              FlexButton(
                                flexButton: 762,
                                innerSpaceVertical: 30,
                                innerSpaceHorizontal: 150,
                                flexTextVertical: 66,
                                flexTextHorizontal: 462,
                                textContent: "Ubah Password",
                                textColor: Colors.white,
                                buttonColor: Color(0xFFFF583C),
                                buttonRadius:
                                    MediaQuery.of(context).size.width *
                                        (20 / 1080),
                                action: () {
                                  if ((passwordController2.text
                                              .substring(0, 1) ==
                                          passwordController2.text
                                              .substring(0, 1)
                                              .toUpperCase()) &&
                                      (passwordController3.text
                                              .substring(0, 1) ==
                                          passwordController3.text
                                              .substring(0, 1)
                                              .toUpperCase()) &&
                                      ((passwordController2.text.contains(
                                          new RegExp('(?:[^a-z]*[a-z])')))) &&
                                      ((passwordController3.text.contains(
                                          new RegExp('(?:[^a-z]*[a-z])')))) &&
                                      (passwordController2.text
                                          .contains(new RegExp(r'[0-9]'))) &&
                                      (passwordController2.text.length >= 8) &&
                                      (passwordController3.text
                                          .contains(new RegExp(r'[0-9]'))) &&
                                      (passwordController3.text.length >= 8)) {
                                    if ((passwordController.text ==
                                            user.password) &&
                                        (passwordController.text !=
                                            passwordController2.text) &&
                                        (passwordController2.text ==
                                            passwordController3.text)) {
                                      FirestoreService().updateUser(
                                        userId: user.id,
                                        newData: <String, dynamic>{
                                          "password": passwordController2.text
                                        },
                                        nextAction: () {
                                          AlertNotification(
                                            context: context,
                                            backgroundColor: Color(0xFF43A047),
                                            aspectRatio: 664 / 95,
                                            widthPercent: 0.615,
                                            iconPath:
                                                "assets/Icon_ChecklistSnackbar.svg",
                                            textContent:
                                                "Berhasil memperbarui password akun",
                                            flexContentVertical: 38,
                                            flexIconHorizontal: 35,
                                            flexTextHorizontal: 539,
                                            textMaxLines: 1,
                                            duration: 3000,
                                          );
                                        },
                                      );

                                      passwordController.clear();
                                      passwordController2.clear();
                                      passwordController3.clear();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    } else if ((passwordController.text ==
                                        passwordController2.text)) {
                                      AlertNotification(
                                        context: context,
                                        backgroundColor: Color(0xFFFFA000),
                                        aspectRatio: 953 / 95,
                                        widthPercent: 0.882,
                                        iconPath:
                                            "assets/Icon_WarningSnackbar.svg",
                                        textContent:
                                            "Password baru tidak boleh sama dengan password baru",
                                        flexContentVertical: 38,
                                        flexIconHorizontal: 35,
                                        flexTextHorizontal: 828,
                                        textMaxLines: 1,
                                        duration: 3000,
                                      );
                                    } else {
                                      AlertNotification(
                                        context: context,
                                        backgroundColor: Color(0xFFFFA000),
                                        aspectRatio: 610 / 95,
                                        widthPercent: 0.564,
                                        iconPath:
                                            "assets/Icon_WarningSnackbar.svg",
                                        textContent:
                                            "Silahkan isi formulir dengan benar",
                                        flexContentVertical: 38,
                                        flexIconHorizontal: 35,
                                        flexTextHorizontal: 485,
                                        textMaxLines: 1,
                                        duration: 3000,
                                      );
                                    }
                                  } else {
                                    AlertNotification(
                                      context: context,
                                      backgroundColor: Color(0xFFFFA000),
                                      aspectRatio: 887 / 95,
                                      widthPercent: 0.821,
                                      iconPath:
                                          "assets/Icon_WarningSnackbar.svg",
                                      textContent:
                                          "Password yang dimasukkan tidak sesuai persyaratan",
                                      flexContentVertical: 38,
                                      flexIconHorizontal: 35,
                                      flexTextHorizontal: 762,
                                      textMaxLines: 1,
                                      duration: 3000,
                                    );
                                  }
                                },
                              ),
                              FlexSpace(109),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              FlexSpace(50),
            ],
          ),
          AspectRatio(aspectRatio: 1080 / 150),
        ],
      ),
      makeClearFocus: true,
    );
  }
}
