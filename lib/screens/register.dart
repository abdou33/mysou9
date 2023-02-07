import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Models/usermodel.dart';
import '../helper/userdata.dart';
import 'Home.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final auth = FirebaseAuth.instance;
  PageController _pageController = PageController(initialPage: 1);

  //user controllers
  // our form key
  final formkey = GlobalKey<FormState>();
  TextEditingController userfirstname = TextEditingController();
  TextEditingController userlastname = TextEditingController();
  TextEditingController useremail = TextEditingController();
  TextEditingController userphonenum = TextEditingController();
  TextEditingController userpass = TextEditingController();
  TextEditingController userpass2 = TextEditingController();

  //boutique controllers
  TextEditingController boutiquename = TextEditingController();
  TextEditingController boutiquephonenum = TextEditingController();
  TextEditingController boutiquewilaya = TextEditingController();
  TextEditingController boutiqueDaira = TextEditingController();
  TextEditingController boutiqueig = TextEditingController();
  TextEditingController boutiquefb = TextEditingController();

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
    //user fields
    final userpass1field = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: userpass,
      onSaved: (value) {
        userpass.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    final userpass2field = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: userpass2,
      validator: (value) {
        if (userpass.text != userpass2.text) {
          return "password dont match";
        }
        return null;
      },
      onSaved: (value) {
        userpass2.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "confirm password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //firstname
    final firstnamefield = TextFormField(
      autofocus: false,
      controller: userfirstname,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter a first name");
        }
        return null;
      },
      onSaved: (value) {
        userfirstname.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //lastname
    final lastnamefield = TextFormField(
      autofocus: false,
      controller: userlastname,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter a Last name");
        }
        return null;
      },
      onSaved: (value) {
        userlastname.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Last name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //email
    final emailfield = TextFormField(
      autofocus: false,
      controller: useremail,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        useremail.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email address",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //phonenum
    final phonenumfield = TextFormField(
      autofocus: false,
      controller: userphonenum,
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter a valid phone number");
        }
        return null;
      },
      onSaved: (value) {
        userphonenum.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.phone_android_rounded),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Phone number",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //submit button
    final usersignupbutton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.orange.shade400,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(28, 13, 28, 13),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          usersignup(useremail.text, userpass.text, context);
        },
        child: Text(
          "Register",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          //first page
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 15),
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
                            changePage(true);
                          },
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Form(
                      key: formkey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                            width: 200,
                            child: Image.asset("assets/logo.jpeg"),
                          ),
                          SizedBox(height: 10),
                          firstnamefield,
                          SizedBox(
                            height: 20,
                          ),
                          lastnamefield,
                          SizedBox(
                            height: 20,
                          ),
                          emailfield,
                          SizedBox(
                            height: 20,
                          ),
                          phonenumfield,
                          SizedBox(
                            height: 20,
                          ),
                          userpass1field,
                          SizedBox(
                            height: 20,
                          ),
                          userpass2field,
                          SizedBox(
                            height: 20,
                          ),
                          usersignupbutton,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //second page
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                  width: 230,
                  child: TextButton(
                    onPressed: () {
                      changePage(false);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        Text(
                          "Register as user",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ],
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 15)),
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      //maximumSize: MaterialStateProperty.all(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 70,
                  width: 230,
                  child: TextButton(
                    onPressed: () {
                      changePage(true);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Register as Boutique",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 15))),
                  ),
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

  void usersignup(String email, String pass, BuildContext context) async {
    if (formkey.currentState!.validate()) {
      await auth
          .createUserWithEmailAndPassword(email: email, password: pass)
          .then((value) {
        postDetailsToFirestore(context);
      }).catchError((e) {
        print("error is ==" + e.message);
        if (e!.message ==
            "A network error (such as timeout, interrupted connection or unreachable host) has occurred.") {
          Fluttertoast.showToast(
            msg: "No internet connection!",
            gravity: ToastGravity.CENTER,
            toastLength: Toast.LENGTH_LONG,
            backgroundColor: Color.fromARGB(255, 11, 11, 11),
            textColor: Colors.white,
            fontSize: 18.0,
          );
        } else if (e!.message ==
            "The email address is already in use by another account.") {
          useremail.clear();
          //notify the user
          Fluttertoast.showToast(
            msg: "this email already exists!",
            gravity: ToastGravity.CENTER,
            toastLength: Toast.LENGTH_LONG,
            backgroundColor: Color.fromARGB(255, 11, 11, 11),
            textColor: Colors.white,
            fontSize: 18.0,
          );
        } else if (e!.message == "The email address is badly formatted.") {
          useremail.clear();
          Fluttertoast.showToast(
            msg: "invalid username!",
            gravity: ToastGravity.CENTER,
            toastLength: Toast.LENGTH_LONG,
            backgroundColor: Color.fromARGB(255, 11, 11, 11),
            textColor: Colors.white,
            fontSize: 18.0,
          );
        } else {
          Fluttertoast.showToast(
            msg: e!.message,
            gravity: ToastGravity.CENTER,
            toastLength: Toast.LENGTH_LONG,
            backgroundColor: Color.fromARGB(255, 11, 11, 11),
            textColor: Colors.white,
            fontSize: 18.0,
          );
        }
      });
    }
  }

  postDetailsToFirestore(BuildContext context) async {
    //calling our firestore
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;

    //save data
    UserModel usermodel = UserModel();

    //writing all values
    usermodel.uid = user!.uid;
    usermodel.firstname = userfirstname.text;
    usermodel.lastname = userlastname.text;
    usermodel.email = useremail.text;
    usermodel.phonenum = userphonenum.text;

    await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(usermodel.toMap())
        .then((value) {
      HelpFunctions.saveuserloggedinsharedref(true);
      HelpFunctions.saveusernamesharedref(user.uid);
    });

    Fluttertoast.showToast(msg: "account created successfully");

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
