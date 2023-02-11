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
            height: 50,
          ),
          SizedBox(
            height: 100,
            width: 100,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/logo.jpeg'),
            ),
          ),
          SizedBox(
            height: 50,
          ),

          ExpansionTile(
            title: Text("Parapharmacie"),
            children: <Widget>[
              Text("Gamme Pédiatrique"),
              Text("Gamme PARAPHARM"),
              Text("Gamme OTC"),
              Text("Gamme Diabéto"),
              Text("Gamme Dermato"),
            ], //
          ),
          ExpansionTile(
            title: Row(
              children: [
                Text("Bébé et Grossesse  "),
                Icon(Icons.baby_changing_station),
              ],
            ),
          ),
          ExpansionTile(
            title: Text("Cosmétiques"),
            children: <Widget>[
              Text("Cheveux"),
              Text("Maquillage"),
              Text("Nettoyage Visage"),
              Text("Soin Du Corps"),
            ], //
          ),
          ExpansionTile(
            title: Text("Vêtement & Mode"),
            children: <Widget>[
              Text("Ensembles Tshirt/Short"),
              Text("Ensembles Sweat/Short"),
              Text("Survêtement Sport"),
              Text("T-Shirts"),
              Text("Pull"),
              Text("Sweatshirts"),
              Text("Shorts"),
              Text("Vestes"),
              Text("Jean's"),
              ExpansionTile(
                title: Text("Sous-vêtement"),
                children: [
                  Text("Homme"),
                  Text("Femme"),
                ],
              ),
              ExpansionTile(
                title: Text("Chaussures"),
                children: [
                  Text("Chaussettes"),
                  Text("Baskets & Running"),
                  Text("Claquette"),
                ],
              ),
              ExpansionTile(
                title: Text("Autres"),
                children: [
                  Text("Cabas & Sacs à dos"),
                  Text("Casquettes"),
                  Text("Bonnets"),
                ],
              ),
            ], //
          ),
          //informatique
          ExpansionTile(
            title: Text("Informatique"),
            children: <Widget>[
              ExpansionTile(
                title: Text("Ordinateurs de Bureau"),
                children: [
                  Text("All in one"),
                  Text("Pc de bureau"),
                  Text("Écran"),
                  Text("Onduleur"),
                ],
              ),
              ExpansionTile(
                title: Text("Ordinateurs Portables"),
                children: [
                  Text("Laptop utilisé"),
                  Text("Acer"),
                  Text("Asus"),
                  Text("Condor"),
                  Text("Dell"),
                  Text("Dtech"),
                  Text("HP"),
                  Text("Lenovo"),
                  Text("Wise-Tech"),
                ],
              ),
              ExpansionTile(
                title: Text("Fournitures de Bureau"),
              ),
              ExpansionTile(
                title: Text("Livres & Romans"),
              ),
            ], //
          ),
        ],
      ),
    );
  }
}
