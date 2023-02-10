import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mysou9/screens/Home.dart';
import 'package:mysou9/screens/login.dart';

import 'helper/userdata.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isuserloggedin = false;
  String? uid;
  @override
  void initState() {
    getloggedinstate();
    super.initState();
  }

  getloggedinstate() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if(user != null){
      uid = user!.uid;
    }

    await HelpFunctions.getuserloggedinsharedref().then((value) {
      print("value1 is = " + value.toString());
      setState(() {
        if(value != null){
          isuserloggedin = value;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'PTSansNarrow',
          // appBarTheme: AppBarTheme(
          //     backgroundColor:
          //         g == "male" ? Colors.blue[100] : Colors.pink[100]),
          // scaffoldBackgroundColor:
          //     g == "male" ? Colors.blue[50] : Colors.pink[50],
          // cardColor: g == "male" ? Colors.blue[100] : Colors.pink[100]
          ),
      home: isuserloggedin != null
          ? isuserloggedin == true
              ? uid == null ? Center(child: CircularProgressIndicator(color: Colors.pink,)) : HomeScreen(uid: uid)
              : LoginPage()
          : Center(child: CircularProgressIndicator()),
    );
  }
}
