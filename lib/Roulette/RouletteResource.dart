import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mbl_hud/Roulette/Capsule/CapsuleVideo.dart';

class RouletteResource extends StatefulWidget {
  final Widget details;
  final Image videoThumbnail;
  final CapsuleVideo videoContent;

  RouletteResource({required this.details, required this.videoContent, required this.videoThumbnail});

  @override
  State<StatefulWidget> createState() => _RouletteResource();
}

class _RouletteResource extends State<RouletteResource> {
  bool playVideo = false;
  bool visibleDetails = false;

  @override
  void initState() {
    super.initState();
    widget.videoContent.build();
    Timer(Duration(seconds: 5), () {
      try {
        setState(() {
          playVideo = true;
        });
      } catch (e) {}
    });
  }

  void onHover(Object event) {
    setState(() {
      visibleDetails = event is PointerEnterEvent;
    });
  }

  void onClick() {
    setState(() {
      visibleDetails = !visibleDetails;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> interface = [
       playVideo?widget.videoContent.build():widget.videoThumbnail,
    ];

    if (visibleDetails) {
      interface.add(widget.details);
    }

    return MouseRegion(
      onExit: onHover,
      onEnter: onHover,
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          child: Stack(
            fit: StackFit.expand,
            children: interface,
          ),
        ),
      ),
    );
  }
}