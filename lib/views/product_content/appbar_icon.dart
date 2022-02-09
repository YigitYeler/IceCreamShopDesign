import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  final IconData icon;
  final bool isLeading;
  const AppBarIcon({Key key, @required this.icon, @required this.isLeading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: isLeading
          ? EdgeInsets.only(left: width * 5 / 100)
          : EdgeInsets.only(right: width * 5 / 100),
      child: isLeading
          ? Icon(
              Icons.arrow_back,
              color: Color.fromRGBO(202, 78, 91, 1),
            )
          : Icon(
              Icons.favorite_border,
              color: Color.fromRGBO(202, 78, 91, 1),
            ),
    );
  }
}
