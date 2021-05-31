import 'package:flutter/material.dart';
import 'package:superhero/app/core/utils/const_app.dart';

class ProgressIndicatorWidget extends StatefulWidget {
  final double value;

  const ProgressIndicatorWidget({Key? key, required this.value})
      : super(key: key);
  @override
  _ProgressIndicatorWidgetState createState() =>
      _ProgressIndicatorWidgetState();
}

class _ProgressIndicatorWidgetState extends State<ProgressIndicatorWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  void _initAnimation() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 900));
    _animation =
        Tween<double>(begin: 0.0, end: widget.value).animate(_controller);
    _controller.forward();
  }

  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) => Row(
        children: [
          Text(
            "${(_animation.value * 100).toInt()}",
            style: ConstApp.styleTitleBold,
          ),
          SizedBox(
            width: 8,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: LinearProgressIndicator(
              value: _animation.value,
              backgroundColor: Colors.red[900],
              valueColor: AlwaysStoppedAnimation<Color>(ConstApp.colorGreen),
            ),
          ),
        ],
      ),
    );
  }
}

// class ProgressIndicatorWidget extends StatelessWidget {
//   final double value;
//   const ProgressIndicatorWidget({Key? key, required this.value})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return LinearProgressIndicator(
//       value: value,
//       backgroundColor: Colors.red[900],
//       valueColor: AlwaysStoppedAnimation<Color>(ConstApp.colorGreen),
//     );
//   }
// }
