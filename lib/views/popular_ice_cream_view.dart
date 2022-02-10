import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PopularIceCream extends StatelessWidget {
  PopularIceCream({Key key}) : super(key: key);
  Color color = Color(0xffB4C0F0);

  @override
  Widget build(BuildContext context) {
    var rng = Random().nextInt(4);
    if (rng == 0) {}
    print(rng);

    Color getWidget(ind) {
      switch (ind) {
        case 0:
          return Color(0xffFB5696);
          break;
        case 1:
          return Color(0xffFDDA83);
          break;
        case 2:
          return Color(0xffB4C0F0);
          break;
        case 3:
          return Color(0xffFB5696);
          break;
        default:
          return Colors.pink;
          break;
      }
    }

    Image getWidget1(ind) {
      switch (ind) {
        case 0:
          return Image.asset(
            "images/vanilla.png",
            scale: 1.3,
          );
          break;
        case 1:
          return Image.asset(
            "images/neopolitan.png",
            scale: 1.3,
          );

          break;
        case 2:
          return Image.asset(
            "images/coconut.png",
            scale: 1.3,
          );

          break;
        case 3:
          return Image.asset(
            "images/vanilla.png",
            scale: 1.3,
          );

          break;
        default:
          return Image.asset(
            "images/vanilla.png",
            scale: 1.3,
          );

          break;
      }
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    CollectionReference data = FirebaseFirestore.instance.collection('data');

    return Container(
      width: width,
      height: height * 7 / 100,
      child: FutureBuilder<DocumentSnapshot>(
        future: data.doc("popularIceCream").get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data.exists) {
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data.data() as Map<String, dynamic>;
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data["iceCream"].length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        color: getWidget(index).withOpacity(0.4),
                        borderRadius: BorderRadius.circular(17)),
                    child: Row(
                      children: [
                        Container(
                          width: width * 13 / 100,
                          height: height * 10 / 100,
                          decoration: BoxDecoration(
                              color: getWidget(index),
                              borderRadius: BorderRadius.circular(17)),
                          child: getWidget1(index),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: width * 2 / 100, right: width * 4 / 100),
                          child: Text(data["iceCream"][index]),
                        ),
                      ],
                    ),
                  );
                });
          }

          return Text("loading");
        },
      ),
    );
  }
}
