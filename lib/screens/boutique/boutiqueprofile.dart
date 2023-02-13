import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mysou9/screens/messaging.dart';

import '../../helper/getgoods.dart';
import '../user/productpage.dart';

class Boutiqueprofile extends StatefulWidget {
  String? id;
  Boutiqueprofile({super.key, this.id});

  @override
  State<Boutiqueprofile> createState() => _BoutiqueprofileState(id: id);
}

class _BoutiqueprofileState extends State<Boutiqueprofile> {
  _BoutiqueprofileState({this.id});
  String? id;
  Stream<QuerySnapshot>? goodsstream;
  databasemethods goodsdata = new databasemethods();

  Widget productList() {
    return StreamBuilder(
      stream: goodsstream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        return goodsstream != null
            ? snapshot.hasData
                ? RefreshIndicator(
                    onRefresh: () async {
                      setState(() {
                        getsellerproducts();
                      });
                      return Future<void>.delayed(
                          const Duration(milliseconds: 10));
                    },
                    child: GridView(
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.0,
                        crossAxisSpacing: 0.0,
                        mainAxisSpacing: 5,
                        mainAxisExtent: 264,
                      ),
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        //getimage(data["photo link"]);
                        return productsTile(
                          data["name"].toString(),
                          data["price"],
                          data["photos"][0],
                          data["id"],
                        );
                      }).toList(),
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: () async {
                      setState(() {
                        getsellerproducts();
                      });
                      return Future<void>.delayed(
                          const Duration(milliseconds: 50));
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 1.3,
                      child:
                          const Center(child: Text("no internet connection!!")),
                    ),
                  )
            : SizedBox(
                height: MediaQuery.of(context).size.height / 1.3,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                    strokeWidth: 3,
                  ),
                ),
              );
      },
    );
  }

  @override
  void initState() {
    getsellerproducts();
    // TODO: implement initState
    super.initState();
  }

  getsellerproducts() async {
    goodsdata.getproducts().then((value) {
      setState(() {
        goodsstream = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            color: Color(0xFFbe332e),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/logo.jpeg'),
                    )),
                Expanded(child: SizedBox.shrink()),
                //fb
                Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: GestureDetector(
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/facebook.png'),
                      ),
                    ),
                  ),
                ),
                //ig
                Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: GestureDetector(
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/instagram.png'),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                //tiktok
                Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: GestureDetector(
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/TikTok.png'),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Text(
                  "MY Boutique",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Row(
              children: [
                Text(
                  "Rue Almoujahidine n41, Illizi",
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox.shrink(),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(
                        color: Color(0xFFbe332e),
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                onPressed: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ConversationScreen("", "My Boutique")));
                }),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5,),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.messenger_sharp,
                        size: 16,
                        color: Color(0xFFbe332e),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "message",
                        style: TextStyle(fontSize: 16, color: Color(0xFFbe332e)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFFbe332e)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),),
                ),
                onPressed: (() {}),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5,),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        color: Colors.white,
                        Icons.check_circle,
                        size: 16,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Follow",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
          Divider(
            thickness: 1, // thickness of the line
            indent: 1, // empty space to the leading edge of divider.
            endIndent: 1, // empty space to the trailing edge of the divider.
            color: Color(0xFFbe332e), // The color to use when painting the line.
            height: 20, // The divider's height extent.
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(30), right: Radius.circular(30))),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      productList(),
                    ],
                  ),
                ),
            ),
          ),
        ],
      ),
    );
  }
}

class productsTile extends StatelessWidget {
  String id;
  final String name;
  final int price;
  final image;

  productsTile(this.name, this.price, this.image, this.id);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
        onTap: () {
          showModalBottomSheet<void>(
            isScrollControlled: true,
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0)),
            ),
            builder: (BuildContext context) {
              return ProductPage(
                id: id,
              );
            },
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Card(
            child: Container(
              height: 290,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.all(0),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Image.network(
                          image,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              price.toString() + " DA",
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xFFbe332e)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //jkdbhngvkjghkvjfjkvlm
            /*Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            elevation: 4.0,
            child: Column(
              children: [
                Container(
                  height: width/2-8,
                  child: Ink.image(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(6.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Text(
                        name,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        price.toString() + " DA",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xFFbe332e)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )*/
          ),
        ));
  }
}
