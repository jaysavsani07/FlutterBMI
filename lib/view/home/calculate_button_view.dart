import 'package:bmi_calculator/view/common/animate_button.dart';
import 'package:flutter/material.dart';

class CalculateButtonView extends StatefulWidget {
  final Function() onTab;

  const CalculateButtonView({
    required this.onTab,
    Key? key,
  }) : super(key: key);

  @override
  State<CalculateButtonView> createState() => _CalculateButtonViewState();
}

class _CalculateButtonViewState extends State<CalculateButtonView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedLoader(
          animation: _controller,
          // alignment: FractionalOffset.center,
          child: Container(
            alignment: Alignment.bottomCenter,
            width: 215.0,
            height: 62.0,
            decoration: BoxDecoration(
              color: Color.fromRGBO(179, 157, 219, 0.4),
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.all(11.0),
          child: MaterialButton(
            child: Text(
              'Calculate'.toUpperCase(),
              style: TextStyle(
                  color: Colors.white, fontSize: 16.0, letterSpacing: 1),
            ),
            color: Colors.deepPurple,
            elevation: 2.0,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            minWidth: 200.0,
            height: 50.0,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            onPressed: widget.onTab,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
