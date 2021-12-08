import 'package:flutter/material.dart';

class AnimatedSquareScreen extends StatelessWidget {
  const AnimatedSquareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Squared Demo'),
      ),
      body: Center(
        child: SizedBox.square(
          child: Container(
            color: Colors.blue.shade400,
          ),
          dimension: 120,
        ),
      ),
    );
  }
}
