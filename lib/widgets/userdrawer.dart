import 'package:flutter/material.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                height: 75,
                width: 75,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/logo.jpeg'),
                ),
              ),
              SizedBox(width: 50,),
              Text("Login...", style: TextStyle(fontSize: 25),),
            ],
          ),
          SizedBox(
            height: 10,
          ),

          ExpansionTile(
            title: Text("Women's Fashion"),
            leading: Icon(Icons.woman_outlined),
            children: <Widget>[
              ListTile(title: Text("Women's Fashion ")),
              ListTile(title: Text("Muslim Fashion ")),
              ListTile(title: Text("Bottoms ")),
              ListTile(title: Text("Plus Size Clothes ")),
              ListTile(title: Text("Weddings & Events ")),
              ListTile(title: Text("Accessories ")),
              
            ], //
          ),
          //111111111111111111111111111
          ExpansionTile(
            title: Text("Men's Fashion"),
            leading: Icon(Icons.man),
            children: <Widget>[
              ListTile(title: Text("Bottoms ")),
              ListTile(title: Text("Outerwear & Jackets ")),
              ListTile(title: Text("Underwear & Loungewear")),
              ListTile(title: Text("Accessories ")),
              ListTile(title: Text("Novelty & Special Use ")),
            ], //
          ),
          //22222222222222222222222222
          ExpansionTile(
            title: Text("Phones & Telecommunications"),
            leading: Icon(Icons.phone_android_outlined),
            children: <Widget>[
              ListTile(title: Text("Mobile Phones")),
              ListTile(title: Text("Hot Brands ")),
              ListTile(title: Text("Mobile Phone Accessories")),
              ListTile(title: Text("Mobile Phone Parts")),
              ListTile(title: Text("Communication Equipments...")),
            ], //
          ),
          //33333333333333333333333333333333333333
          ExpansionTile(
            title: Text("Computer, Office & Security"),
            leading: Icon(Icons.computer),
            children: <Widget>[
              ListTile(title: Text("Components & Peripherals")),
              ListTile(title: Text("Laptops")),
              ListTile(title: Text("Security & Protection")),
              ListTile(title: Text("Storage Devices")),
              ListTile(title: Text("Office Electronics")),
              ListTile(title: Text("Computer Networking ")),
            ], //
          ),
          //44444444444444444444444444444444444444
          ExpansionTile(
            title: Text("Jewelry & Watches"),
            leading: Icon(Icons.watch),
            children: <Widget>[
              ListTile(title: Text("Fine Jewelry")),
              ListTile(title: Text("Wedding & Engagement ")),
              ListTile(title: Text("Men's Watches")),
              ListTile(title: Text("Women's Watches")),
              ListTile(title: Text("Fashion Jewelry")),
              ListTile(title: Text("Beads & DIY Jewelry")),
            ], //
          ),
          //5555555555555555555555555555555555
          ExpansionTile(
            title: Text("Home, Pet & Appliances"),
            leading: Icon(Icons.home),
            children: <Widget>[
              ListTile(title: Text("Arts, Crafts & Sewing ")),
              ListTile(title: Text("Home Decor")),
              ListTile(title: Text("Home Textiles")),
              ListTile(title: Text("Celebrations")),
              ListTile(title: Text("Home Storage")),
              ListTile(title: Text("Household Items")),
              ListTile(title: Text("Kitchen ")),
              ListTile(title: Text("Garden & Pets")),
              ListTile(title: Text("Furniture")),
            ], //
          ),
          //666666666666666666666666666666666
          ExpansionTile(
            title: Text("Bags & Shoes"),
            leading: Icon(Icons.shopping_bag),
            children: <Widget>[
              ListTile(title: Text("Women's Luggage & Bags")),
              ListTile(title: Text("Women's Shoes")),
              ListTile(title: Text("Men's Luggage & Bags")),
              ListTile(title: Text("Men's Shoes")),
              ListTile(title: Text("Other Bags & Accessories")),
              ListTile(title: Text("Bestselling Shoes ")),
            ], //
          ),
          //777777777777777777777777777777777
          ExpansionTile(
            title: Text("Toys , Kids & Babies"),
            leading: Icon(Icons.baby_changing_station),
            children: <Widget>[
              ListTile(title: Text("Baby(0-3years old)")),
              ListTile(title: Text("For Girls")),
              ListTile(title: Text("For Boys")),
              ListTile(title: Text("Mother & Baby Items")),
              ListTile(title: Text("Remote Control")),
              ListTile(title: Text("Toys & Hobbies")),
            ], //
          ),
          //8888888888888888888888888888888888
          ExpansionTile(
            title: Text("Beauty, Health & Hair"),
            leading: Icon(Icons.light_mode_sharp),
            children: <Widget>[
              ListTile(title: Text("Hair Weaves")),
              ListTile(title: Text("Wigs")),
              ListTile(title: Text("Synthetic Hair")),
              ListTile(title: Text("Makeup")),
              ListTile(title: Text("Health Care")),
              ListTile(title: Text("Skin Care")),
              ListTile(title: Text("Nail Art & Tools")),
              ListTile(title: Text("Personal Care")),
              ListTile(title: Text("Massage & Relaxation")),
            ], //
          ),
          //999999999999999999999999999999999999
          ExpansionTile(
            title: Text("Automobiles & Motorcycles"),
            leading: Icon(Icons.motorcycle),
            children: <Widget>[
              ListTile(title: Text("Auto Replacement Parts")),
              ListTile(title: Text("Tools, Maintenance & Care")),
              ListTile(title: Text("Car Electronics")),
              ListTile(title: Text("Exterior Accessories")),
              ListTile(title: Text("Motorcycle Accessories & Parts")),
              ListTile(title: Text("Interior Accessories")),
            ], //
          ),
        ],
      ),
    );
  }
}
