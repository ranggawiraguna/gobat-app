import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class GeneralRadioItem extends StatelessWidget {
  const GeneralRadioItem({
    Key? key,
    required this.label,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final String groupValue;
  final String value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1 / 1,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Transform.scale(
                scale: 0.85,
                child: Radio<String>(
                  groupValue: groupValue,
                  value: value,
                  onChanged: (String? newValue) {
                    onChanged(newValue!);
                  },
                ),
              ),
            ),
          ),
          AspectRatio(aspectRatio: 1 / 1),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: AutoSizeText(
                label,
                minFontSize: 1,
                maxFontSize: 100,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'Folks',
                  fontSize: 100,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
