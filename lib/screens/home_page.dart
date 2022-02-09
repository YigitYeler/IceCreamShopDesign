import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ice_cream_shop/views/popular_ice_cream_view.dart';
import 'package:ice_cream_shop/views/title_text_view.dart';
import 'package:ice_cream_shop/views/title_view.dart';
import 'package:ice_cream_shop/views/top_flavours_view.dart';
import 'package:ice_cream_shop/views/top_item_container.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String imgUrl = "../../images/img.jpg";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleView(),
              Stack(
                children: [
                  SizedBox(
                    width: width * 91 / 100,
                    child: inputContainer(width, height, context),
                  ),
                  Positioned(
                    right: 0,
                    top: 5,
                    child: filterContainer(height, width),
                  )
                ],
              ),
              TitleText(
                  title: "Top Flavours",
                  fontSize: 17,
                  fontWeight: FontWeight.w700),
              TopFlavours(),
              TitleText(
                  title: "Popular Ice Cream",
                  fontSize: 17,
                  fontWeight: FontWeight.w700),
              PopularIceCream(),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TitleText(
                    title: "Top Item",
                    fontSize: 17,
                    fontWeight: FontWeight.w700),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TopItemContainer(),
                  TopItemContainer(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container filterContainer(double height, double width) {
    return Container(
      height: height * 8 / 100,
      width: width * 23 / 100,
      decoration: BoxDecoration(
          color: Color(0xFFFC659D), borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.tune,
            color: Colors.white,
          ),
          Text(
            "Filter",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Container inputContainer(double width, double height, BuildContext context) {
    return Container(
      height: height * 9.7 / 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      margin: EdgeInsets.only(right: width * 5 / 100),
      child: Theme(
        child: Padding(
          padding: EdgeInsets.fromLTRB(2, 2, width * 10 / 100, 2),
          child: TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(18),
              focusColor: Colors.grey[300],
              prefixIcon: Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey[300],
              border: InputBorder.none,
              hintText: "Search",
              hintStyle: TextStyle(fontWeight: FontWeight.w300),
            ),
          ),
        ),
        data: Theme.of(context).copyWith(
          primaryColor: Colors.grey[500],
        ),
      ),
    );
  }
}
