import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ConversationScreen extends StatefulWidget {
  final String chatroomId;
  final String theotheruser;
  ConversationScreen(this.chatroomId, this.theotheruser);

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  TextEditingController msgeditingcontroller = new TextEditingController();
  Stream<QuerySnapshot>? chatmessageStream;

  // here we set the timer to call the event
  ScrollController _myController = ScrollController();

  // Widget chatmessagelist() {
  //   Timer(Duration(milliseconds: 500),
  //       () => _myController.jumpTo(_myController.position.maxScrollExtent));
  //   return StreamBuilder(
  //     stream: chatmessageStream,
  //     builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //       return chatmessageStream != null
  //           ? snapshot.data != null
  //               ? ListView(
  //                   controller: _myController,
  //                   children:
  //                       snapshot.data!.docs.map((DocumentSnapshot document) {
  //                     Map<String, dynamic> data =
  //                         document.data()! as Map<String, dynamic>;
  //                     //print(data["message"]);
  //                     if (Constants.Myusername != data["sendby"] &&
  //                         (DateTime.now().millisecondsSinceEpoch -
  //                                 data["time"]) < 5000) {
  //                       print("diference = " + (DateTime.now().millisecondsSinceEpoch - data["time"]).toString());
  //                       Notifivationapi.showNotification(
  //                         title: data["sendby"],
  //                         body: data["message"],
  //                         payload: '',
  //                       );
  //                     }
  //                     Future.delayed(Duration(milliseconds: 100), () {
  //                       _myController.animateTo(
  //                           _myController.position.maxScrollExtent,
  //                           duration: Duration(milliseconds: 50),
  //                           curve: Curves.ease);
  //                     });
  //                     return messagetile(
  //                       data["message"],
  //                       Constants.Myusername == data["sendby"],
  //                       data["time"],
  //                     );
  //                   }).toList(),
  //                 )
  //               : Container()
  //           : Container();
  //     },
  //   );
  // }

  // sendmessage() {
  //   if (msgeditingcontroller.text.isNotEmpty) {
  //     Map<String, dynamic> messagemap = {
  //       "message": msgeditingcontroller.text,
  //       "sendby": Constants.Myusername!,
  //       "time": DateTime.now().millisecondsSinceEpoch,
  //     };
  //     databasemethodes.addcnvmessages(widget.chatroomId, messagemap);
  //     msgeditingcontroller.clear();
  //     //
  //     Future.delayed(Duration(milliseconds: 100), () {
  //       _myController.animateTo(_myController.position.maxScrollExtent,
  //           duration: Duration(milliseconds: 100), curve: Curves.ease);
  //     });
  //   }
  // }

  // @override
  // void initState() {
  //   databasemethodes.getcnvmessages(widget.chatroomId).then((value) {
  //     setState(() {
  //       chatmessageStream = value;
  //     });
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Color(0xFFbe332e),
        title: Text(widget.theotheruser),
      ),
      body: Container(
        child: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 70),
              child: //chatmessagelist(),
              SizedBox(),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(0),
                color: Color(0xFFbe332e),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 10),
                        child: TextField(
                          cursorColor: Colors.black,
                          showCursor: false,
                          autofocus: true,
                          controller: msgeditingcontroller,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            hintText: "Type a message...",
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    //Image.asset("assets/logo.png"),
                    GestureDetector(
                      onTap: () {
                        //sendmessage();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.symmetric(horizontal: 1),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40)),
                          child: Image.asset("assets/send.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

class messagetile extends StatelessWidget {
  final String message;
  final bool sendby;
  final int time;
  messagetile(this.message, this.sendby, this.time);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 8, bottom: 8, left: sendby ? 0 : 24, right: sendby ? 24 : 0),
      alignment: sendby ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            margin:
                sendby ? EdgeInsets.only(left: 30) : EdgeInsets.only(right: 30),
            padding: EdgeInsets.only(top: 17, bottom: 17, left: 20, right: 20),
            decoration: BoxDecoration(
                borderRadius: sendby
                    ? BorderRadius.only(
                        topLeft: Radius.circular(23),
                        topRight: Radius.circular(23),
                        bottomLeft: Radius.circular(23))
                    : BorderRadius.only(
                        topLeft: Radius.circular(23),
                        topRight: Radius.circular(23),
                        bottomRight: Radius.circular(23)),
                color: Colors.green),
            child: Text(message,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'OverpassRegular',
                    fontWeight: FontWeight.w500)),
          ),
          // Text(
          //     DateFormat('dd/MM/yyyy, HH:mm')
          //         .format(DateTime.fromMillisecondsSinceEpoch(time))
          //         .toString(),
          //     textAlign: TextAlign.center,
          //     style: TextStyle(
          //         color: Colors.black,
          //         fontSize: 11,
          //         fontWeight: FontWeight.w300)),
        ],
      ),
    );
  }
}