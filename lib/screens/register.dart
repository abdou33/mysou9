import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  PageController _pageController = PageController();

  changePage(bool a) {
    if (a) {
      _pageController.nextPage(
          duration: Duration(milliseconds: 400), curve: Curves.easeIn);
    } else {
      _pageController.previousPage(
          duration: Duration(milliseconds: 400), curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        //physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          //first page
          Container(
            child: Column(children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: GestureDetector(
                      child: Icon(Icons.arrow_forward),
                      onTap: () {
                        print("yes");
                        changePage(true);
                      },
                    ),
                  )
                ],
              ),
              Text("register user"),
            ]),
          ),
          //second page
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    changePage(true);
                  },
                  child: Text(
                    "Register as user",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue)),
                ),
                TextButton(
                  onPressed: () {
                    changePage(false);
                  },
                  child: Text("Register as Boutique",
                      style: TextStyle(color: Colors.white)),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.orange)),
                ),
              ],
            ),
          ),
          //third page
          Container(
            child: Column(children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: GestureDetector(
                      child: Icon(Icons.arrow_back),
                      onTap: () {
                        print("yes");
                        changePage(false);
                      },
                    ),
                  )
                ],
              ),
              Text("register store"),
            ]),
          ),
        ],
      ),
    );
  }
}
