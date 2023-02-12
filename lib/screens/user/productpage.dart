import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../helper/getgoods.dart';
import '../boutique/boutiqueprofile.dart';

class ProductPage extends StatefulWidget {
  final String? id;
  const ProductPage({super.key, this.id});

  @override
  State<ProductPage> createState() => _ProductPageState(id: id);
}

class _ProductPageState extends State<ProductPage> {
  _ProductPageState({this.id});
  final String? id;

  String? name;
  String? description;
  String? seller;
  int? stock;
  int? price;
  List? images;

  databasemethods productdata = databasemethods();
  QuerySnapshot? querySnapshot;

  @override
  void initState() {
    // TODO: implement initState
    getproductinfos();
    super.initState();
  }

  getproductinfos() async {
    await productdata.getproductdetails(id!).then((value) {
      setState(() {
        querySnapshot = value;
        name = querySnapshot!.docs.first.get('name');
        description = querySnapshot!.docs.first.get('description');
        seller = querySnapshot!.docs.first.get('seller');
        stock = querySnapshot!.docs.first.get('stock');
        price = querySnapshot!.docs.first.get('price');
        images = querySnapshot!.docs.first.get('photos');
        print(images.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return images != null
        ? Padding(
            padding: EdgeInsets.all(5),
            child: ListView(
              children: [
                Container(
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      height: width + 50,
                      aspectRatio: 16 / 9,
                      enlargeCenterPage: true,
                    ),
                    itemCount: images!.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(images![itemIndex]!,
                          fit: BoxFit.fitWidth),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name!,
                            style: TextStyle(
                                fontSize: 45, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          Text("$price  DZD",
                              style: TextStyle(
                                fontSize: 25,
                              )),
                              Text("$stock in stock"),
                              //description
                          Text("Description:", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: width-50,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "$description", //put your own long text here.
                                        maxLines: 300,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Boutiqueprofile(id: seller,)));
                  },
                  child: Text("go to seller profile"),
                ),
                SizedBox(height: 50,),
                SizedBox(
                  height: width / 6,
                  width: width - 50,
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFFbe332e)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )),
                    ),
                    child: Text(
                      "Buy",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
