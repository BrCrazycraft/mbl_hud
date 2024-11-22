import 'package:flutter/cupertino.dart';

abstract class CapsuleVideo {
  Future<void> preload();
  Widget build();
}