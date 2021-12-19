import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gobat_app/widgets/FlexButton.dart';
import 'package:gobat_app/widgets/FlexSpace.dart';

class Consultation extends StatefulWidget {
  @override
  ConsultationState createState() => ConsultationState();
}

class ConsultationState extends State<Consultation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 60.0),
      child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            child: Row(
              children: [
                FlexSpace(100),
                Flexible(
                    flex: 880,
                    child: Column(
                      children: [
                        FlexSpace(100),
                        Flexible(
                          flex: 176,
                          child: SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            child: AutoSizeText(
                              "Konsultasikan Gejala\nKamu",
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              minFontSize: 1,
                              style: TextStyle(
                                overflow: TextOverflow.clip,
                                fontSize: 100,
                                fontFamily: "Folks",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        FlexSpace(75),
                        Flexible(
                            flex: 878,
                            child: Container(
                              child: SvgPicture.asset(
                                  "assets/Illustration_Consultation.svg"),
                            )),
                        FlexSpace(50),
                        Flexible(
                          flex: 342,
                          child: SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            child: AutoSizeText(
                              "Segera konsultasikan gejala yang kamu\nalami dengan menjawab pertanyaan-\npertanyaan yang disediakan, kami akan\nmencoba menemukan penyakit yang kamu\nalami serta solusi yang tepat untuk\nmengatasinya",
                              textAlign: TextAlign.center,
                              maxLines: 6,
                              minFontSize: 1,
                              style: TextStyle(
                                overflow: TextOverflow.clip,
                                fontSize: 100,
                                fontFamily: "Folks",
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        FlexSpace(50),
                        Flexible(
                            flex: 126,
                            child: Row(
                              children: [
                                FlexButton(
                                    flexButton: 762,
                                    innerSpaceVertical: 30,
                                    innerSpaceHorizontal: 150,
                                    flexTextVertical: 66,
                                    flexTextHorizontal: 462,
                                    textContent: "Mulai Konsultasi",
                                    textColor: Colors.white,
                                    buttonColor: Color(0xFFFF583C),
                                    buttonRadius:
                                        MediaQuery.of(context).size.width *
                                            (20 / 1080),
                                    action: () {}),
                              ],
                            )),
                        FlexSpace(129),
                      ],
                    )),
                FlexSpace(100),
              ],
            ),
          )),
    );
  }
}
