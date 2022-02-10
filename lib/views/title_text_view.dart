import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  const TitleText(
      {Key key,
      @required this.title,
      @required this.fontSize,
      @required this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: height * 2 / 100, bottom: height * 1 / 100),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
