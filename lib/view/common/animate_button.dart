import 'package:flutter/cupertino.dart';

class AnimatedLoader extends AnimatedWidget {
  static final _opacityTween = new Tween<double>(begin: 0.0, end: 1.0);

  AnimatedLoader({
    Key? key,
    this.alignment = FractionalOffset.center,
    required this.animation,
    required this.child,
  }) : super(key: key, listenable: animation);

  final FractionalOffset alignment;
  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacityTween.evaluate(animation),
      child: child,
    );
  }
}
