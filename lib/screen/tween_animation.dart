import 'package:flutter/material.dart';

class TweenAnimationScreen extends StatefulWidget {
  const TweenAnimationScreen({Key? key}) : super(key: key);

  @override
  _TweenAnimationScreenState createState() => _TweenAnimationScreenState();
}

class _TweenAnimationScreenState extends State<TweenAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(
          seconds: 2,
        ),
        vsync: this);

    _animation = Tween<double>(begin: 10, end: 240)
        .chain(CurveTween(curve: Curves.bounceOut))
        .animate(_animationController);

    _animation.addListener(() {
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
                      left: _animation.value,
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
            Column(
              children: [
                Text(
                    "AnimationController.value: ${_animationController.value.toStringAsFixed(2)}"),
                SizedBox(
                  height: 20,
                ),
                Text(
                    "Animation.value: ${(_animation.value as double).toStringAsFixed(2)}"),
              ],
            ),
            SizedBox(
              height: 40,
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
