// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobat_app/models/User.dart';
import 'package:gobat_app/pages/ConsultationQuestions.dart';
import 'package:gobat_app/pages/Main.dart';
import 'package:gobat_app/services/FirestoreService.dart';
import 'package:gobat_app/services/GlobalValue.dart';
import 'package:gobat_app/services/NavigatorServices.dart';
import 'package:gobat_app/widgets/FlexButton.dart';
import 'package:gobat_app/widgets/FlexSpace.dart';
import 'package:provider/provider.dart';

class DialogConsultationError extends StatefulWidget {
  final String userId;

  const DialogConsultationError({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  _DialogConsultationErrorState createState() =>
      _DialogConsultationErrorState();
}

class _DialogConsultationErrorState extends State<DialogConsultationError> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: const EdgeInsets.all(0),
        insetPadding: const EdgeInsets.all(0),
        titlePadding: const EdgeInsets.all(0),
        buttonPadding: const EdgeInsets.all(0),
        actionsPadding: const EdgeInsets.all(0),
        content: SingleChildScrollView(
          reverse: true,
          child: SizedBox(
            width: GlobalValue.getSizeConstraint(context, 1030),
            height: GlobalValue.getSizeConstraint(context, 1336),
            child: Center(
              child: SizedBox(
                width: GlobalValue.getSizeConstraint(context, 930),
                height: GlobalValue.getSizeConstraint(context, 1236),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        GlobalValue.getSizeConstraint(context, 20)),
                    color: const Color(0xFFFFFFFF),
                  ),
                  child: Row(
                    children: [
                      FlexSpace(75),
                      Flexible(
                          flex: 780,
                          child: Column(
                            children: [
                              FlexSpace(75),
                              Flexible(
                                  flex: 763,
                                  child: Center(
                                      child: SvgPicture.asset(
                                          "assets/Illustration_ConsultationError.svg"))),
                              FlexSpace(75),
                              FlexButton(
                                flexButton: 99,
                                innerSpaceVertical: 20,
                                innerSpaceHorizontal: 205,
                                flexTextVertical: 59,
                                flexTextHorizontal: 370,
                                textContent: "Konsultasi Ulang",
                                textColor: Colors.white,
                                buttonColor: Color(0xFFFF583C),
                                buttonRadius:
                                    MediaQuery.of(context).size.width *
                                        (20 / 1080),
                                action: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                  Navigator.of(context)
                                      .pushReplacement(NavigatorFade(
                                    child: StreamProvider<User?>.value(
                                      value: FirestoreService()
                                          .user(widget.userId),
                                      initialData: User.empty,
                                      child: ConsultationQuestions(),
                                    ),
                                  ));
                                },
                              ),
                              FlexSpace(50),
                              FlexButton(
                                flexButton: 99,
                                innerSpaceVertical: 20,
                                innerSpaceHorizontal: 171,
                                flexTextVertical: 59,
                                flexTextHorizontal: 438,
                                textContent: "Kembali ke Beranda",
                                textColor: Colors.black,
                                buttonColor: Color(0xFFF7FBFE),
                                buttonRadius:
                                    MediaQuery.of(context).size.width *
                                        (20 / 1080),
                                action: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      NavigatorScale(
                                        child: Main(page: 2),
                                      ),
                                      (Route<dynamic> route) => false);
                                },
                              ),
                              FlexSpace(75),
                            ],
                          )),
                      FlexSpace(75),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
