import 'package:flutter/material.dart';

class PopularIceCream extends StatelessWidget {
  const PopularIceCream({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height * 10 / 100,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                color: Colors.pink, borderRadius: BorderRadius.circular(17)),
            width: width * 30 / 100,
            height: height * 5 / 100,
            child: Row(
              children: [
                Container(
                  width: width * 13 / 100,
                  height: height * 10 / 100,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(17)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 2 / 100),
                  child: Text("Content"),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                color: Colors.pink, borderRadius: BorderRadius.circular(17)),
            width: width * 30 / 100,
            height: height * 5 / 100,
            child: Row(
              children: [
                Container(
                  width: width * 13 / 100,
                  height: height * 10 / 100,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(17)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 2 / 100),
                  child: Text("Content"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
