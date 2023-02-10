import 'package:flutter/material.dart';

class BoutiqueHome extends StatefulWidget {
  const BoutiqueHome({super.key});

  @override
  State<BoutiqueHome> createState() => _BoutiqueHomeState();
}

class _BoutiqueHomeState extends State<BoutiqueHome> {
  bool _searchBoolean = false; //add
  String searchresult = "";

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
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
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
                        Text("boutique")
          ],
        ),
      ),
    );
  }
}
