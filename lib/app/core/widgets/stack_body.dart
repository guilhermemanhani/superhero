import 'package:flutter/material.dart';

class StackBody extends StatefulWidget {
  final Widget body;

  StackBody({
    required this.body,
  });

  @override
  _StackBody createState() => _StackBody();
}

class _StackBody extends State<StackBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black12,
        ),
        Column(
          children: [
            Container(
              color: Colors.transparent,
              height: 10,
              width: MediaQuery.of(context).size.width,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 5,
                    ),
                  ],
                ),
                // color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width,
                child: widget.body,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
