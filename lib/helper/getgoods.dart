import 'package:cloud_firestore/cloud_firestore.dart';

class databasemethods {
  getproducts() async {
    return await FirebaseFirestore.instance
        .collection("produits")
        .snapshots();
  }

  getrecipedetails(String title) async {
    return await FirebaseFirestore.instance
        .collection("produits")
        .where("العنوان", isEqualTo: title)
        .get();
  }
}