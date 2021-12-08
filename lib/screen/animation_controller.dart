import 'package:flutter/material.dart';

class AnimationControllerScreen extends StatefulWidget {
  const AnimationControllerScreen({Key? key}) : super(key: key);

  @override
  _AnimationControllerScreenState createState() =>
      _AnimationControllerScreenState();
}

class _AnimationControllerScreenState extends State<AnimationControllerScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(
          seconds: 2,
        ),
        vsync: this);

    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Animated Controller Demo'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Positioned(
                      left: _animationController.value * 240,
                      top: 0,
                      child: SizedBox(
                        child: Container(
                          width: 120,
                          height: 120,
                          color: Colors.green.shade600,
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _animationController.forward();
                    },
                    child: Text('Start')),
                ElevatedButton(
                    onPressed: () {
                      _animationController.stop();
                    },
                    child: Text('Stop')),
                ElevatedButton(
                    onPressed: () {
                      _animationController.reset();
                    },
                    child: Text('Reset')),
                ElevatedButton(
                    onPressed: () {
                      _animationController.reverse();
                    },
                    child: Text('Reverse')),
              ],
            ),
          ],
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
}
