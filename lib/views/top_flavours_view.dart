import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TopFlavours extends StatefulWidget {
  const TopFlavours({Key key}) : super(key: key);

  @override
  _TopFlavoursState createState() => _TopFlavoursState();
}

class _TopFlavoursState extends State<TopFlavours> {
  @override
  Widget build(BuildContext context) {
    CollectionReference data = FirebaseFirestore.instance.collection('data');
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return FutureBuilder<DocumentSnapshot>(
      future: data.doc("topFlavours").get(),
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
                contentContainer(data, width, height),
              ],
            ),
          );
        }

        return Text("loading");
      },
    );
  }

  Container contentContainer(
      Map<String, dynamic> data, double width, double height) {
    return Container(
      width: width * 50 / 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            data["title"],
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 17,
            ),
          ),
          secondRow(data, height, width),
          thirdRow(data),
        ],
      ),
    );
  }

  Container thirdRow(Map<String, dynamic> data) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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

  Row secondRow(Map<String, dynamic> data, double height, double width) {
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
              data["quantity"],
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
                '${data["point"]}',
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
