import 'package:cloud_firestore/cloud_firestore.dart';

class databasemethods {
  getproducts() async {
    return await FirebaseFirestore.instance
        .collection("produits")
        .snapshots();
  }

  getproductdetails(String title) async {
    return await FirebaseFirestore.instance
        .collection("produits")
        .where("id", isEqualTo: title)
        .get();
  }

  getsellerproducts(String title) async {
    return await FirebaseFirestore.instance
        .collection("produits")
        .where("seller", isEqualTo: title)
        .get();
  }
}