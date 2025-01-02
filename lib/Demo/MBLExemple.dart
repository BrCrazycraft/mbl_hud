import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mbl_hud/Roulette/Capsule/CapsuleAudio.dart';
import 'package:mbl_hud/Roulette/Capsule/CapsuleVideo.dart';

class MblExempleHomeDetails extends StatelessWidget {
  final String title;
  final String description;

  MblExempleHomeDetails({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(0,0,0, 0.75),
      child: Container(
        margin: EdgeInsetsDirectional.symmetric(horizontal: 32),
        child: Column(
          children: [
            Text(title, style: TextStyle(color: Colors.white, fontSize: 32), ),
            Expanded(child: Text(description, style: TextStyle(color: Colors.white), textAlign: TextAlign.justify,))
          ],
        ),
      ),
    );
  }
}

class MblExempleHomeVideo extends CapsuleVideo {
  @override
  Widget build() {
    return Container(
      color: Colors.lightGreen,
      child: Text("Video carregado", textAlign: TextAlign.center, style: TextStyle(fontSize: 64, color: Colors.white),),
    );
  }

  @override
  Future<void> preload() async {
    print("Lógica para carregar Widget de video da biblioteca");
  }
}

class MblExempleHomeAudio extends CapsuleAudio {
  @override
  void play() {
    print("Tocando Som.");
  }

  @override
  Future<void> preload() async {
    print("Carregou música de forma assincorna");
  }
}