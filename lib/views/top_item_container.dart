import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TopItemContainer extends StatefulWidget {
  final int sayi;
  const TopItemContainer({Key key, @required this.sayi}) : super(key: key);

  @override
  _TopItemContainerState createState() => _TopItemContainerState();
}

class _TopItemContainerState extends State<TopItemContainer> {
  CollectionReference data = FirebaseFirestore.instance.collection('data');

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(),
      padding: EdgeInsets.symmetric(horizontal: width * 2 / 100),
      decoration: BoxDecoration(
        color: widget.sayi == 0 ? Color(0xffDEF4FF) : Color(0xffFADADD),
        borderRadius: BorderRadius.circular(17),
      ),
      width: width * 40 / 100,
      height: height * 30 / 100,
      child: FutureBuilder<DocumentSnapshot>(
        future: data.doc("topItem").get(),
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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height * 15 / 100,
                  width: width * 40 / 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: widget.sayi == 0
                      ? Image.asset(
                          "images/sherbet0.png",
                          scale: 1,
                        )
                      : Image.asset(
                          "images/sherbet1.png",
                          scale: 1,
                        ),
                ),
                Text(
                  "${data["title"]}",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                Text(
                  "${data["info"]}",
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
                              "${data["price"]}",
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
                        backgroundColor: Color(0xffFB4387),
                        child: Icon(
                          Icons.add,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }

          return Text("loading");
        },
      ),
    );
  }
}
