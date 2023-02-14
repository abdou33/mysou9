import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mysou9/screens/boutique/boutiqueprofile.dart';
import 'package:mysou9/screens/user/productpage.dart';
import 'package:mysou9/widgets/userdrawer.dart';

import '../../helper/getgoods.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  bool isloading = false;
  Stream<QuerySnapshot>? goodsstream;
  databasemethods goodsdata = new databasemethods();

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
                    child: GridView(
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.0,
                        crossAxisSpacing: 0.0,
                        mainAxisSpacing: 1,
                        mainAxisExtent: 264,
                      ),
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        //getimage(data["photo link"]);
                        return recipestile(
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
    getuserinfo();
    super.initState();
  }

  getuserinfo() async {
    goodsdata.getproducts().then((value) {
      setState(() {
        goodsstream = value;
        //isloading = true;
        // Future.delayed(Duration(seconds: 5), () {
        //   setState(() {
        //
        //   });
        // });
      });
    });
  }

  int pagesindex = 0;

  void _onItemTapped(int index) {
    setState(() {
      pagesindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: UserDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFFbe332e),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: pagesindex,
        selectedItemColor: Color(0xFFbe332e),
        unselectedItemColor: Colors.grey,
        onTap: ((value) {
          _onItemTapped(value);
        }),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Form(
              child: Container(
                width: 320,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color(0xFFbe332e)),
                    borderRadius: BorderRadius.circular(30)),
                child: TextFormField(
                  decoration: const InputDecoration(
                    alignLabelWithHint: true,
                      hintText: "Search products",
                      //contentPadding: EdgeInsets.only(right: 10.0),
                      suffixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      ),
                ),
              ),
            ),
            SizedBox(
              height: ((width) / 4) * 2,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) =>
                      GridOptions(layout: options[index]),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                  ),
                ),
              ),
            ),
            Expanded(child: recipeslist()),
          ],
        ),
      ),
    );
  }
}

class recipestile extends StatelessWidget {
  String id;
  final String name;
  final int price;
  final image;

  recipestile(this.name, this.price, this.image, this.id);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          enableDrag: false,
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
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            elevation: 4.0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Card(
                    elevation: 0,
                    //color: Colors.purpleAccent,
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
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
                                          fontSize: 20,
                                          color: Color(0xFFbe332e)),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                  ),
                ))));
  }
}

class GridLayout {
  final String title;
  final IconData icon;

  GridLayout({required this.title, required this.icon});
}

List<GridLayout> options = [
  GridLayout(title: 'See all', icon: Icons.grid_view_rounded),
  GridLayout(title: 'Furnitures', icon: Icons.home),
  GridLayout(title: 'Men', icon: Icons.man_rounded),
  GridLayout(title: 'Women', icon: Icons.woman_rounded),
  GridLayout(title: 'Electronics', icon: Icons.electrical_services_rounded),
  GridLayout(title: 'Book', icon: Icons.book),
  GridLayout(title: 'Mobiles', icon: Icons.mobile_friendly_rounded),
  GridLayout(title: 'Kids', icon: Icons.child_care_rounded),
];

class GridOptions extends StatelessWidget {
  final GridLayout layout;
  GridOptions({required this.layout});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              layout.icon,
              size: 25,
              color: Color(0xFFbe332e),
            ),
            Text(
              layout.title,
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
