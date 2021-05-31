import 'package:flutter/material.dart';
import 'package:superhero/app/core/utils/const_app.dart';

class BuildTextInfoHero extends StatefulWidget {
  final String title;
  final String heroData;

  const BuildTextInfoHero({
    Key? key,
    required this.title,
    required this.heroData,
  }) : super(key: key);
  @override
  _BuildTextInfoHeroState createState() => _BuildTextInfoHeroState();
}

class _BuildTextInfoHeroState extends State<BuildTextInfoHero> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Text.rich(
        TextSpan(
          text: widget.title,
          style: ConstApp.styleTitleGreyDark,
          children: [
            TextSpan(
              text: widget.heroData,
              style: ConstApp.styleTitleGreyBright,
            ),
          ],
        ),
      ),
    );
  }
}
