import 'package:flutter/material.dart';

class TopItemContainer extends StatefulWidget {
  const TopItemContainer({Key key}) : super(key: key);

  @override
  _TopItemContainerState createState() => _TopItemContainerState();
}

class _TopItemContainerState extends State<TopItemContainer> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: height * 1 / 100),
      padding: EdgeInsets.symmetric(horizontal: width * 2 / 100),
      decoration: BoxDecoration(
          color: Colors.pink, borderRadius: BorderRadius.circular(17)),
      width: width * 40 / 100,
      height: height * 30 / 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height * 15 / 100,
            width: width * 40 / 100,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(17),
            ),
          ),
          Text(
            "Top Item",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
          Text(
            "With strawberry jam",
            style: TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: 15,
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        color: Colors.red,
                      ),
                      Text(
                        "14,60",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  mini: true,
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.add,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
