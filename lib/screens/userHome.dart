import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
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
          ],
        ),
      ),
    );
  }
}
