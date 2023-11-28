import 'package:flutter/material.dart';
import '../screens/Home.dart';
import '../screens/Create.dart';
import '../screens/Lista.dart';

Widget Menu(BuildContext context) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("Parking Spot"),
          accountEmail: Text("parkingspot@app.com"),
          currentAccountPicture: Image.network(
            "https://img.freepik.com/vetores-gratis/estacionamento_24908-54058.jpg",
          ),
          decoration: BoxDecoration(
            color: Color(0xff1a7777),
          ),
        ),
        Divider(), // Add a divider between header and list items
        ListTileTheme(
          selectedColor: Colors.green,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                ),
              ),
              ListTile(
                leading: Icon(Icons.list),
                title: Text("Vagas"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListaPage()),
                ),
              ),
              ListTile(
                leading: Icon(Icons.add),
                title: Text("Cadastro"),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Create()),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
