// ignore_for_file: non_constant_identifier_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:gobat_app/widgets/FlexSpace.dart';

Flexible InfoCounterProfile(String title, int count) => Flexible(
      flex: 267,
      child: Column(
        children: [
          FlexSpace(44),
          Flexible(
            flex: 52,
            child: AutoSizeText(
              count.toString(),
              textAlign: TextAlign.start,
              maxLines: 1,
              minFontSize: 1,
              style: TextStyle(
                fontSize: 100,
                fontFamily: "Folks",
                fontWeight: FontWeight.bold,
                color: Color(0xFF404040),
              ),
            ),
          ),
          FlexSpace(10),
          Flexible(
            flex: 50,
            child: AutoSizeText(
              title,
              textAlign: TextAlign.start,
              maxLines: 1,
              minFontSize: 1,
              style: TextStyle(
                fontSize: 100,
                fontFamily: "Folks",
                color: Color(0xFF404040),
              ),
            ),
          ),
          FlexSpace(44),
        ],
      ),
    );
