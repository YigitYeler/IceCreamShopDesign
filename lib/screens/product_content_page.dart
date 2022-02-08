import 'package:flutter/material.dart';
import 'package:ice_cream_shop/views/product_content/appbar_icon.dart';

class ProductContent extends StatefulWidget {
  const ProductContent({Key key}) : super(key: key);

  @override
  _ProductContentState createState() => _ProductContentState();
}

class _ProductContentState extends State<ProductContent> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
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
                color: Colors.pink,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: height * 5 / 100),
              width: width * 90 / 100,
              height: height * 40 / 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Raspberry Ice Cream",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  Row(
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
                        "4.9 (229 Reviews)",
                        style: TextStyle(
                          color: Colors.grey[350],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: width * 30 / 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              child: Container(
                                width: width * 6.4 / 100,
                                height: width * 6.4 / 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.pink,
                                ),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              "2 Kg",
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                            InkWell(
                              child: Container(
                                width: width * 6.4 / 100,
                                height: width * 6.4 / 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.pink,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
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
                            Text(
                              "14,60",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Text(
                    "lşsadflkşasmdflkamlkgmsdaöfmçasödmşsadflkşasmdflkamlkgmsdaöfmçasödmfçöasmdşsadflkşasmdflkamlkgmsdaöfmçasödmfçöasmdfçöasmdföasdasdasdasdasdçamweklfmawfkmsdafçömsaödf",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  InkWell(
                    child: Container(
                      width: width,
                      height: height * 10 / 100,
                      decoration: BoxDecoration(
                          color: Colors.pink,
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
