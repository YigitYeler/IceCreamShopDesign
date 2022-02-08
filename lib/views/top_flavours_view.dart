import 'package:flutter/material.dart';

class TopFlavours extends StatefulWidget {
  const TopFlavours({Key key}) : super(key: key);

  @override
  _TopFlavoursState createState() => _TopFlavoursState();
}

class _TopFlavoursState extends State<TopFlavours> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(17),
      ),
      width: width,
      height: height * 20 / 100,
      child: Row(
        children: [
          imageContainer(height, width),
          contentContainer(width, height),
        ],
      ),
    );
  }

  Container contentContainer(double width, double height) {
    return Container(
      width: width * 50 / 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Vanilla Ice Cream",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 17,
            ),
          ),
          secondRow(height, width),
          thirdRow(),
        ],
      ),
    );
  }

  Container thirdRow() {
    return Container(
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
    );
  }

  Row secondRow(double height, double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: height * 3.5 / 100,
          width: width * 9 / 100,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(17),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: height * 0.4 / 100),
            child: Text(
              "1 KG",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Container(
          child: Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Text(
                "4.9",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container imageContainer(double height, double width) {
    return Container(
      height: height * 20 / 100,
      width: width * 35 / 100,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(17),
      ),
    );
  }
}
