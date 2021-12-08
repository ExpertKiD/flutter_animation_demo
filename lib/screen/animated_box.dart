import 'package:flutter/material.dart';

class AnimatedSquareScreen extends StatefulWidget {
  const AnimatedSquareScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedSquareScreen> createState() => _AnimatedSquareScreenState();
}

class _AnimatedSquareScreenState extends State<AnimatedSquareScreen> {
  late double squareSize;

  @override
  void initState() {
    super.initState();
    squareSize = 150;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Squared Demo'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 400,
            child: Center(
              child: AnimatedContainer(
                color: Colors.blue.shade400,
                width: squareSize,
                height: squareSize,
                duration: Duration(seconds: 1, milliseconds: 500),
                curve: Curves.bounceOut,
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  if (squareSize == 150) {
                    squareSize = 300;
                  } else {
                    squareSize = 150;
                  }
                });
              },
              child: Text('Animate'))
        ],
      ),
    );
  }
}
