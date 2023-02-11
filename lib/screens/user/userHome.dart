import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mysou9/screens/boutique/boutiqueprofile.dart';
import 'package:mysou9/widgets/userdrawer.dart';

import '../../helper/getgoods.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  bool _searchBoolean = false; //add
  String searchresult = "";
  bool isloading = false;
  Stream<QuerySnapshot>? goodsstream;
  databasemethods goodsdata = new databasemethods();

  Widget _searchTextField() {
    //add
    return TextField(
      onChanged: (Text) {
        setState(() {
          searchresult = Text;
        });
      },
      textAlign: TextAlign.left,
      autofocus: true,
      cursorColor: Colors.white,
      textDirection: TextDirection.ltr,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration.collapsed(
        hintText: 'Search',
        hintTextDirection: TextDirection.rtl,
        hintStyle: TextStyle(
          color: Colors.white60,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget recipeslist() {
    return StreamBuilder(
      stream: goodsstream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //print("snapshot has error: " + snapshot.data!.docs.length.toString());
        //print("is null?: " + goodsstream!.isEmpty.toString());
        //print(snapshot.data!.docs.toString());
        return goodsstream != null
            ? snapshot.hasData
                ? RefreshIndicator(
                    onRefresh: () async {
                      setState(() {
                        getuserinfo();
                      });
                      return Future<void>.delayed(
                          const Duration(milliseconds: 10));
                    },
                    child: ListView(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        //getimage(data["photo link"]);
                        return recipestile(
                          data["name"].toString(),
                          data["price"],
                          data["photos"][0],
                        );
                      }).toList(),
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: () async {
                      setState(() {
                        getuserinfo();
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

  void initState() {
    print("first");
    getuserinfo();
    super.initState();
  }

  getuserinfo() async {
    goodsdata.getproducts().then((value) {
      print("snapshot data ======================== \t" + value.toString());

      setState(() {
        print(goodsstream.toString());
        goodsstream = value;
        //isloading = true;
        print(goodsstream.toString());
        // Future.delayed(Duration(seconds: 5), () {
        //   setState(() {
        //
        //   });
        // });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: UserDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFFbe332e),
        title: !_searchBoolean ? SizedBox.shrink() : _searchTextField(),
        actions: [
          !_searchBoolean ? SizedBox.shrink() : Icon(Icons.tune),
          // Navigate to the Search Screen
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print(_searchBoolean.toString());
                setState(() {
                  _searchBoolean
                      ? _searchBoolean = false
                      : _searchBoolean = true;
                });
                print(_searchBoolean.toString());
              }),
        ],
      ),
      body: Padding(padding: EdgeInsets.all(5), child: recipeslist()),
    );
  }
}

class recipestile extends StatelessWidget {
  final String name;
  final int price;
  final image;

  recipestile(this.name, this.price, this.image);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => recipe(titlename),
        //     ));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Card(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10),),
      ),
       elevation: 4.0,
       child: Column(
           children: [
             Container(
               height: 200.0,
               child: Ink.image(
                 image: NetworkImage(image),
                 fit: BoxFit.cover,
               ),
             ),
             Container(
               padding: EdgeInsets.all(16.0),
               alignment: Alignment.centerLeft,
               child: Column(
                 children: [
                   Text(name, style: TextStyle(fontSize: 20),),
                   Text(price.toString() + " DA", style: TextStyle(fontSize: 20, color: Color(0xFFbe332e)),),
                 ],
               ),
             ),
           ],
         ),
)
      ),
    );
  }
}
