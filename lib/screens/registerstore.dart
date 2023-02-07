import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegisterStore extends StatelessWidget {
  const RegisterStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Icon(Icons.arrow_back),
              )
            ],
          ),
        Text("register store"),
        ]
      ),
    );
  }
}