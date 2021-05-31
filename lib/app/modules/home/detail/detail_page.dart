import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:superhero/app/core/widgets/build_power_status_hero.dart';
import 'package:superhero/app/core/widgets/build_text_info_hero.dart';
import 'package:superhero/app/core/widgets/stack_body.dart';
import 'package:superhero/app/models/heros_model.dart';
import 'package:superhero/app/modules/home/detail/detail_store.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String title;
  final HerosModel herosModel;
  const DetailPage(
      {Key? key, this.title = 'DetailPage', required this.herosModel})
      : super(key: key);
  @override
  DetailPageState createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  final DetailStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Modular.to.pop(context);
          },
        ),
        backgroundColor: Colors.black12,
        title: Text(
          widget.herosModel.name,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: StackBody(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 0,
                    child: CachedNetworkImage(
                      imageUrl: widget.herosModel.images.sm,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BuildTextInfoHero(
                            title: "Slug: ", heroData: widget.herosModel.slug),
                        BuildTextInfoHero(
                            title: "Full Name: ",
                            heroData: widget.herosModel.biography.fullName),
                        BuildTextInfoHero(
                            title: "AlterEgos: ",
                            heroData: widget.herosModel.biography.alterEgos),
                        BuildTextInfoHero(
                            title: "Gender: ",
                            heroData: widget.herosModel.appearance.gender),
                        BuildTextInfoHero(
                            title: "Race: ",
                            heroData: widget.herosModel.appearance.race),
                        BuildTextInfoHero(
                            title: "Height: ",
                            heroData:
                                "${widget.herosModel.appearance.height[0]} - ${widget.herosModel.appearance.height[1]}"),
                        BuildTextInfoHero(
                            title: "Weight: ",
                            heroData:
                                "${widget.herosModel.appearance.weight[0]} - ${widget.herosModel.appearance.weight[1]}"),
                        BuildTextInfoHero(
                            title: "Eye color: ",
                            heroData: widget.herosModel.appearance.eyeColor),
                        BuildTextInfoHero(
                            title: "Hair color: ",
                            heroData: widget.herosModel.appearance.hairColor),
                        BuildTextInfoHero(
                            title: "Place of birth: ",
                            heroData: widget.herosModel.biography.placeOfBirth),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              BuildPowerStatusHero(
                power: "Intelligence",
                status: widget.herosModel.powerstats.intelligence,
              ),
              BuildPowerStatusHero(
                power: "Strength",
                status: widget.herosModel.powerstats.strength,
              ),
              BuildPowerStatusHero(
                power: "Speed",
                status: widget.herosModel.powerstats.speed,
              ),
              BuildPowerStatusHero(
                power: "Durability",
                status: widget.herosModel.powerstats.durability,
              ),
              BuildPowerStatusHero(
                power: "Power",
                status: widget.herosModel.powerstats.power,
              ),
              BuildPowerStatusHero(
                power: "Combat",
                status: widget.herosModel.powerstats.combat,
              ),
              BuildTextInfoHero(
                  title: "First appearance: ",
                  heroData: widget.herosModel.biography.firstAppearance),
              BuildTextInfoHero(
                  title: "Place of birth: ",
                  heroData: widget.herosModel.biography.placeOfBirth),
              BuildTextInfoHero(
                  title: "Occupation: ",
                  heroData: widget.herosModel.work.occupation),
              BuildTextInfoHero(
                  title: "Base: ", heroData: widget.herosModel.work.base),
              BuildTextInfoHero(
                  title: "Group affiliation: ",
                  heroData: widget.herosModel.connections.groupAffiliation),
              BuildTextInfoHero(
                  title: "Relatives: ",
                  heroData: widget.herosModel.connections.relatives),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
