import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:mysou9/helper/userdata.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,required this.uid});
  final String? uid;

  @override
  State<HomeScreen> createState() => _HomeScreenState(uid);
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState(this.uid);

  final String? uid;
  bool? isuser;

  @override
  void initState() {
    print("uid= $uid ");
    userorboutique();
    super.initState();
  }

  userorboutique() {
    FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: uid)
        .get()
        .then((value) {
      print("afterhehe=======\t" + value.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.orange,
      ),
    );
  }
}
