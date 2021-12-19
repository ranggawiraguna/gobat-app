import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobat_app/models/User.dart';
import 'package:gobat_app/pages/Login.dart';
import 'package:gobat_app/pages/Register.dart';
import 'package:gobat_app/services/FirestoreService.dart';
import 'package:gobat_app/services/NavigatorServices.dart';
import 'package:gobat_app/widgets/FlexButton.dart';
import 'package:gobat_app/widgets/FlexSpace.dart';
import 'package:gobat_app/widgets/OnBoardingSlide.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:provider/provider.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding>
    with SingleTickerProviderStateMixin {
  int page = 0;
  late LiquidController liquidController;
  late UpdateType updateType;
  late Container buttonAction;

  @override
  void initState() {
    liquidController = LiquidController();
    buttonAction = getButtonActionNext(0, 0.0, 1 / 3, 1);

    super.initState();
  }

  final pages = [
    OnBoardingSlide(
        color: Color(0xFF874551),
        asset: "assets/OnBoarding_Illustration_1.svg",
        title: "Temukan Informasi\nDetail Mengenai Obat",
        description:
            "Kamu dapat membaca informasi dari\nberbagai macam obat-obatan agar dapat\nmenyesuaikan dengan kebutuhanmu."),
    OnBoardingSlide(
        color: Color(0xFF208382),
        asset: "assets/OnBoarding_Illustration_2.svg",
        title: "Konsultasikan Gejala\nYang Kamu Alami",
        description:
            "Aplikasi ini dapat membantu kamu\nmenemukan penyakit sesuai dengan gejala\nyang sedang kamu alami."),
    OnBoardingSlide(
        color: Color(0xFF475A76),
        asset: "assets/OnBoarding_Illustration_3.svg",
        title: "Baca Artikel Terkait\nSeputar Kesehatan",
        description:
            "Kamu juga dapat membaca artikel-artikel\nterkait dunia kesehatan untuk dapat\nmenambah wawasan kamu.")
  ];

  Container getButtonActionNext(key, begin, end, nextPage) {
    bool _isClicked = false;

    return Container(
      key: ValueKey<int>(key),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: begin, end: end),
                duration: const Duration(milliseconds: 500),
                builder: (context, value, _) => CircularProgressIndicator(
                  value: value,
                  color: Color(0xFFFF583C),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: ElevatedButton(
                child: SvgPicture.asset("assets/OnBoarding_IconNext.svg"),
                style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(0),
                    shadowColor: Colors.transparent),
                onPressed: () {
                  if (nextPage >= 0 && nextPage <= 2 && !_isClicked) {
                    _isClicked = true;
                    liquidController.shouldDisableGestures(disable: true);
                    liquidController.animateToPage(
                      page: nextPage,
                      duration: 750,
                    );
                    Timer(
                      Duration(milliseconds: 1000),
                      () {
                        liquidController.shouldDisableGestures(disable: false);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: Container(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: <Widget>[
                LiquidSwipe(
                  pages: pages,
                  onPageChangeCallback: pageChangeCallback,
                  waveType: WaveType.liquidReveal,
                  enableLoop: false,
                  liquidController: liquidController,
                  ignoreUserGestureWhileAnimating: true,
                ),
                Container(
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      children: [
                        FlexSpace(1606),
                        Flexible(
                            flex: 200,
                            child: AnimatedSwitcher(
                              duration: Duration(milliseconds: 500),
                              transitionBuilder:
                                  (Widget child, Animation<double> animation) {
                                return ScaleTransition(
                                    child: child, scale: animation);
                              },
                              child: buttonAction,
                            )),
                        FlexSpace(150)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        backgroundColor: Color(0xFFFFFFFF),
      ),
    );
  }

  pageChangeCallback(int lpage) {
    if (page == 1 && lpage == 2) {
      this.setState(() {
        buttonAction = getButtonActionNext(0, 2 / 3, 3 / 3, -1);
      });
      Timer(Duration(milliseconds: 1250), () {
        this.setState(() {
          buttonAction = Container(
            key: ValueKey<int>(1),
            child: Column(
              children: [
                FlexSpace(37),
                Flexible(
                  flex: 126,
                  child: Row(
                    children: [
                      FlexSpace(100),
                      FlexButton(
                        flexButton: 415,
                        innerSpaceVertical: 30,
                        innerSpaceHorizontal: 125,
                        flexTextVertical: 66,
                        flexTextHorizontal: 164,
                        textContent: "Masuk",
                        textColor: Colors.white,
                        buttonColor: Color(0xFFFF583C),
                        buttonRadius: 6,
                        action: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              NavigatorScale(
                                child: StreamProvider<List<User>>.value(
                                  value: FirestoreService().users,
                                  initialData: [],
                                  child: Login(),
                                ),
                              ),
                              (Route<dynamic> route) => false);
                        },
                      ),
                      FlexSpace(50),
                      FlexButton(
                        flexButton: 415,
                        innerSpaceVertical: 30,
                        innerSpaceHorizontal: 126,
                        flexTextVertical: 66,
                        flexTextHorizontal: 163,
                        textContent: "Daftar",
                        textColor: Colors.black,
                        buttonColor: Color(0xFFFFFFFF),
                        buttonRadius: 6,
                        action: () {
                          Navigator.of(context).pushReplacement(
                            NavigatorScale(
                              child: StreamProvider<List<User>>.value(
                                value: FirestoreService().users,
                                initialData: [],
                                child: Register(),
                              ),
                            ),
                          );
                        },
                      ),
                      FlexSpace(100),
                    ],
                  ),
                ),
                FlexSpace(37),
              ],
            ),
          );
        });
      });
    } else {
      this.setState(() {
        buttonAction =
            getButtonActionNext(0, (page + 1) / 3, (lpage + 1) / 3, lpage + 1);
      });
    }

    setState(() {
      page = lpage;
    });
  }
}
