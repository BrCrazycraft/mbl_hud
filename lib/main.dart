import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mbl_hud/Demo/MBLHome.dart';
import 'package:mbl_hud/Roulette/Roulette.dart';
void main() {
  runApp(Mbl());
}

class Mbl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MBL",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Mbl Roleta"),),
      body: Column(
        children: [
          interface(),
          Expanded(child: Text("Conteudo", style: TextStyle(fontSize: 64,color: Colors.white),),)
        ],
      )
    );
  }
}

Widget interface() {
  return MblExempleHome();
}
