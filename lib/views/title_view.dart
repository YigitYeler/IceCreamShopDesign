import 'package:flutter/material.dart';

class TitleView extends StatelessWidget {
  const TitleView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(top: height * 5 / 100, bottom: height * 2 / 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Hey Emma",
                style: TextStyle(
                    fontWeight: FontWeight.w800, fontSize: width * 6 / 100),
              ),
              Text(
                "What flavor do you like to eat?",
                style: TextStyle(fontWeight: FontWeight.w300),
              )
            ],
          ),
          CircleAvatar(
            backgroundImage: AssetImage("images/barbie.jpg"),
          )
        ],
      ),
    );
  }
}
