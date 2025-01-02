import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mbl_hud/Roulette/Capsule/CapsuleAudio.dart';
import 'package:mbl_hud/Roulette/RouletteResource.dart';

class Roulette extends StatefulWidget {
  final double height;
  final Color background;
  final Icon frontButtonIcon;
  final Icon backButtonIcon;
  final ButtonStyle buttonStyle;
  final CapsuleAudio audio;
  final List<RouletteResource> children;


  Roulette({
    required this.height,
    required this.background,
    required this.backButtonIcon,
    required this.frontButtonIcon,
    required this.buttonStyle,
    required this.children,
    required this.audio
  });

  @override
  State<StatefulWidget> createState() => _Roulette();
}

class _Roulette extends State<Roulette> {
  late PageController controller;
  int currentIndex = 0;
  int time = 0;

  void onNext() {
    widget.audio.play();
    setState(() {
      time = 0;
      currentIndex++;
      if (currentIndex == widget.children.length) {
        currentIndex = 0;
      }
    });
    controller.animateToPage(currentIndex, duration: Duration(seconds: 1), curve: Curves.easeIn);
  }

  void onPrev() {
    widget.audio.play();
    setState(() {
      time = 0;
      currentIndex--;
      if (currentIndex == -1) {
        currentIndex = widget.children.length-1;
      }
    });
    controller.animateToPage(currentIndex, duration: Duration(seconds: 1), curve: Curves.decelerate);
  }

  @override
  void initState() {
    super.initState();

    controller = PageController();
    widget.audio.preload();

    Timer.periodic(Duration(seconds: 1), (timer) {
      time++;
      if (time == 15) {
        onNext();
        time = 0;
      }
    },);

    for (RouletteResource resource in widget.children) {
      resource.videoContent.preload();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Icon> bottomMenu = [];

    for (int index = 0;index < widget.children.length;index++) {
      bottomMenu.add(Icon(index==currentIndex?Icons.circle:Icons.circle_outlined, color: Colors.white,));
    }

    return Container(
      height: widget.height,
      color: widget.background,
      child: Stack(
        children: [
          PageView(
            controller: controller,
            children: widget.children
          ),
          Column(
            children: [
              Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(style: widget.buttonStyle,child: widget.backButtonIcon, onPressed: onPrev),
                      TextButton(style: widget.buttonStyle,child: widget.frontButtonIcon, onPressed: onNext),
                    ],
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: bottomMenu,
              )
            ],
          )
        ],
      ),
    );
  }

}