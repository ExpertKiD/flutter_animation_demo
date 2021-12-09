import 'package:animationdemo/screen/tween_animation.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TweenAnimationScreen(),
    );
  }
}
