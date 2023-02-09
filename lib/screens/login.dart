import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../helper/userdata.dart';
import '../widgets/CustomOageRoute.dart';
import 'Home.dart';
import 'register.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // form key
  final formkey = GlobalKey<FormState>();
  //editing controller
  final TextEditingController EmailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  //calling firebase
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: EmailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter an email");
        }
        //reg expression for username validation
        /*if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("this username is already taken");
        }*/
        return null;
      },
      onSaved: (value) {
        EmailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    //pass field
    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordController,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        //if !password
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        //if password < 6
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    //submit button
    final loginbutton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.orange.shade400,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signin(
              EmailController.text, passwordController.text);
        },
        child: Text(
          "login",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    Future<bool> _onWillPop() async {
      return false; //<-- SEE HERE
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: SingleChildScrollView(
                child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 150,
                          child: Image.asset(
                            "assets/logo.jpeg",
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          height: 45,
                        ),
                        emailField,
                        SizedBox(
                          height: 20,
                        ),
                        passwordField,
                        SizedBox(
                          height: 35,
                        ),
                        loginbutton,
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Dont have an account?, '),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  CustomPageRoute(child: RegisterPage()),
                                );
                              },
                              child: Text(
                                'SignUp',
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              ),
                            )
                          ],
                        )
                      ],
                    )),
              ),
            )),
          )),
    );
  }

  //login function
  void signin(String email, String pass) async {
    if (formkey.currentState!.validate()) {
      await auth
          .signInWithEmailAndPassword(email: email, password: pass)
          .then((uid){
        HelpFunctions.saveuserloggedinsharedref(true);
        HelpFunctions.saveusernamesharedref(uid.credential.toString());
        Navigator.of(context).pushReplacement(CustomPageRoute(child: HomeScreen(uid: uid.user!.uid)));
      }).catchError((e) {
        print("error007 is ==" + e!.message);
        if (e == null) {
          print("e is null");
        }
        print(e!.message);
        if (e!.message ==
            "The password is invalid or the user does not have a password.") {
          Fluttertoast.showToast(
            msg: "The password is invalid!",
            gravity: ToastGravity.CENTER,
            toastLength: Toast.LENGTH_LONG,
            backgroundColor: Color.fromARGB(255, 11, 11, 11),
            textColor: Colors.white,
            fontSize: 18.0,
          );
        } else if (e! ==
            "There is no user record corresponding to this identifier. The user may have been deleted.") {
          Fluttertoast.showToast(
            msg: "this username does not exist!",
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
    ;
  }
}