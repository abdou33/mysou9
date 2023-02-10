import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mysou9/screens/messaging.dart';

class Boutiqueprofile extends StatefulWidget {
  const Boutiqueprofile({super.key});

  @override
  State<Boutiqueprofile> createState() => _BoutiqueprofileState();
}

class _BoutiqueprofileState extends State<Boutiqueprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
     color: Colors.black
   ), 
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue[900],
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/logo.jpeg'),
                    )),
                Expanded(child: SizedBox.shrink()),
                //fb
                GestureDetector(
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/facebook.png'),
                    ),
                  ),
                ),
                //ig
                GestureDetector(
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/instagram.png'),
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                //tiktok
                GestureDetector(
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/TikTok.png'),
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1, // thickness of the line
            indent: 1, // empty space to the leading edge of divider.
            endIndent: 1, // empty space to the trailing edge of the divider.
            color: Colors.black, // The color to use when painting the line.
            height: 20, // The divider's height extent.
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Text(
                  "MY Boutique",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Row(
              children: [
                Text(
                  "Rue Almoujahidine n41, Illizi",
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox.shrink(),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.pink.shade100),
                ),
                onPressed: (() {
                  Navigator.push(
        context, MaterialPageRoute(builder: (context) => ConversationScreen("", "My Boutique")));
                }),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.message,
                      size: 16,
                    ),
                    Text(
                      "message",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.orange.shade100),
                ),
                onPressed: (() {}),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 16,
                    ),
                    Text(
                      "Follow",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),
            ],
          )
        ],
      ),
    );
  }
}
