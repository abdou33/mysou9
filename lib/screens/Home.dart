import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(
      icon: Icon(
        Icons.supervised_user_circle,
        color: Colors.white,
      ),
      onPressed: () {
        // do something
      },
    )
        ],
      ),
    );
  }
}