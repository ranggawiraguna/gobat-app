import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobat_app/models/User.dart';
import 'package:gobat_app/services/FirestoreService.dart';
import 'package:gobat_app/widgets/AlertNotification.dart';
import 'package:gobat_app/widgets/DefaultTextField.dart';
import 'package:gobat_app/widgets/FlexButton.dart';
import 'package:gobat_app/widgets/FlexSpace.dart';
import 'package:gobat_app/widgets/ImageProfile.dart';
import 'package:gobat_app/widgets/SubProfileContainer.dart';
import 'package:provider/provider.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  final TextEditingController usernameController = TextEditingController(),
      passwordController = TextEditingController(),
      fullnameController = TextEditingController(),
      emailController = TextEditingController();

  late bool _emailIncorrect;

  @override
  void initState() {
    _emailIncorrect = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    if (usernameController.text != user.username &&
        passwordController.text != user.password &&
        fullnameController.text != user.fullname &&
        emailController.text != user.email) {
      usernameController.text = user.username;
      passwordController.text = user.password;
      fullnameController.text = user.fullname;
      emailController.text = user.email;
    }

    return SubProfileContainer(
      context: context,
      title: "Akun Saya",
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
                                    AspectRatio(aspectRatio: 980 / 100),
                                    AspectRatio(
                                      aspectRatio: 980 / 400,
                                      child: Row(
                                        children: [
                                          FlexSpace(302),
                                          Flexible(
                                            flex: 400,
                                            child: AspectRatio(
                                              aspectRatio: 400 / 387.5,
                                              child: Container(
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Wrap(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Flexible(
                                                                flex: 375,
                                                                child: ImageProfile(
                                                                    context,
                                                                    0.084,
                                                                    0.075,
                                                                    0.010,
                                                                    Color(
                                                                        0xFFE8E8E8),
                                                                    "assets/Photo_DefaultProfileUser.svg"),
                                                              ),
                                                              FlexSpace(25),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      child: Wrap(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              FlexSpace(300),
                                                              Flexible(
                                                                flex: 100,
                                                                child:
                                                                    AspectRatio(
                                                                  aspectRatio:
                                                                      1 / 1,
                                                                  child:
                                                                      ElevatedButton(
                                                                    child: SvgPicture
                                                                        .asset(
                                                                            "assets/Icon_EditImage.svg"),
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              0),
                                                                      primary:
                                                                          Colors
                                                                              .transparent,
                                                                      shadowColor:
                                                                          Colors
                                                                              .transparent,
                                                                    ),
                                                                    onPressed:
                                                                        () {},
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          FlexSpace(278),
                                        ],
                                      ),
                                    ),
                                    AspectRatio(aspectRatio: 980 / 100),
                                    DefaultTextField(
                                      label: "Username",
                                      controller: usernameController,
                                      textInputType: TextInputType.name,
                                      textInputAction: TextInputAction.next,
                                      readOnly: true,
                                    ),
                                    AspectRatio(aspectRatio: 980 / 50),
                                    DefaultTextField(
                                      label: "Password",
                                      controller: passwordController,
                                      textInputType: TextInputType.name,
                                      textInputAction: TextInputAction.next,
                                      readOnly: true,
                                    ),
                                    AspectRatio(aspectRatio: 980 / 50),
                                    DefaultTextField(
                                      label: "Nama Lengkap",
                                      controller: fullnameController,
                                      textInputType: TextInputType.name,
                                      textInputAction: TextInputAction.next,
                                    ),
                                    AspectRatio(aspectRatio: 980 / 50),
                                    DefaultTextField(
                                      label: "Email",
                                      controller: emailController,
                                      textInputType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.done,
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
                                textContent: "Simpan Perubahan",
                                textColor: Colors.white,
                                buttonColor: Color(0xFFFF583C),
                                buttonRadius:
                                    MediaQuery.of(context).size.width *
                                        (20 / 1080),
                                action: () {
                                  Map<String, dynamic> newData =
                                      new Map<String, dynamic>();

                                  if (emailController.text.substring(
                                          (emailController.text.length) - 10,
                                          emailController.text.length) ==
                                      "@gmail.com") {
                                    if (fullnameController.text !=
                                        user.fullname)
                                      newData.addAll({
                                        "fullname": fullnameController.text
                                      });

                                    if (emailController.text != user.email)
                                      newData.addAll(
                                          {"email": emailController.text});

                                    if (newData.isNotEmpty)
                                      FirestoreService().updateUser(
                                        userId: user.id,
                                        newData: newData,
                                        nextAction: () {
                                          AlertNotification(
                                            context: context,
                                            backgroundColor: Color(0xFF43A047),
                                            aspectRatio: 664 / 95,
                                            widthPercent: 0.615,
                                            iconPath:
                                                "assets/Icon_ChecklistSnackbar.svg",
                                            textContent:
                                                "Berhasil memperbarui informasi akun",
                                            flexContentVertical: 38,
                                            flexIconHorizontal: 35,
                                            flexTextHorizontal: 539,
                                            textMaxLines: 1,
                                            duration: 2000,
                                          );
                                        },
                                      );
                                  } else {
                                    setState(() => _emailIncorrect = true);
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
