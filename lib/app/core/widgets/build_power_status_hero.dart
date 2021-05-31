import 'package:flutter/material.dart';
import 'package:superhero/app/core/utils/const_app.dart';
import 'package:superhero/app/core/widgets/progress_indicator_widget.dart';

class BuildPowerStatusHero extends StatefulWidget {
  final String power;
  final int status;

  const BuildPowerStatusHero({
    Key? key,
    required this.power,
    required this.status,
  }) : super(key: key);
  @override
  _BuildPowerStatusHeroState createState() => _BuildPowerStatusHeroState();
}

class _BuildPowerStatusHeroState extends State<BuildPowerStatusHero> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.power,
              style: ConstApp.styleTitleGreyDark,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            flex: 0,
            child: ProgressIndicatorWidget(
              value: widget.status / 100,
            ),
          ),
        ],
      ),
    );
  }
}
