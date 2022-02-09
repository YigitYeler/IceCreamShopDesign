import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ice_cream_shop/views/product_content/appbar_icon.dart';
import 'package:ice_cream_shop/views/title_text_view.dart';

class ProductContent extends StatefulWidget {
  const ProductContent({Key key}) : super(key: key);

  @override
  _ProductContentState createState() => _ProductContentState();
}

class _ProductContentState extends State<ProductContent> {
  @override
  Widget build(BuildContext context) {
    CollectionReference data = FirebaseFirestore.instance.collection('data');

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(236, 198, 211, 1),
        leading: AppBarIcon(
          icon: Icons.arrow_back,
          isLeading: true,
        ),
        actions: [
          AppBarIcon(
            icon: Icons.favorite_border,
            isLeading: false,
          ),
        ],
      ),
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              width: width,
              height: height * 40 / 100,
              decoration: BoxDecoration(
                color: Color.fromRGBO(236, 198, 211, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                ),
              ),
            ),
            FutureBuilder<DocumentSnapshot>(
              future: data.doc("product").get(),
              builder: (
                BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot,
              ) {
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
                    margin: EdgeInsets.only(top: height * 5 / 100),
                    width: width * 90 / 100,
                    height: height * 40 / 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TitleText(
                            title: data["title"],
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                        starsAndReviews(data),
                        quantityAndPriceRow(width, data),
                        Text(
                          data["info"],
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        addToCardContainer(width, height)
                      ],
                    ),
                  );
                }

                return Text("loading");
              },
            ),
          ],
        ),
      ),
    );
  }

  Row starsAndReviews(Map<String, dynamic> data) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        Icon(
          Icons.star,
          color: Colors.grey[350],
        ),
        Text(
          "${data["point"]} (${data["reviews"]} Reviews)",
          style: TextStyle(
            color: Colors.grey[350],
          ),
        )
      ],
    );
  }

  Row quantityAndPriceRow(double width, Map<String, dynamic> data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: width * 30 / 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              quantityButton(width, Icons.remove),
              Text(
                "2 Kg",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              quantityButton(width, Icons.add)
            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              Icon(
                Icons.attach_money,
                color: Colors.red,
                size: 30,
              ),
              TitleText(
                  title: "${data["price"]}0",
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            ],
          ),
        )
      ],
    );
  }

  InkWell quantityButton(double width, IconData icon) {
    return InkWell(
      child: Container(
        width: width * 6.4 / 100,
        height: width * 6.4 / 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.pink,
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }

  InkWell addToCardContainer(double width, double height) {
    return InkWell(
      child: Container(
        width: width,
        height: height * 10 / 100,
        decoration: BoxDecoration(
            color: Color.fromRGBO(221, 66, 134, 1),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "Add to Card",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
    );
  }
}
