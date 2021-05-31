import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:superhero/app/core/utils/const_app.dart';
import 'package:superhero/app/core/widgets/custom_text_form_field_widget.dart';
import 'package:superhero/app/core/widgets/stack_body.dart';
import 'package:superhero/app/modules/home/home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({this.title = "Home"}) : super();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text(
          "Heroes",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.female,
              color: Colors.white,
            ),
            onPressed: () => controller.setFilter("Female"),
          ),
          IconButton(
            icon: Icon(
              Icons.male,
              color: Colors.white,
            ),
            onPressed: () => controller.setFilter("Male"),
          ),
          IconButton(
            icon: Icon(
              Icons.restore,
              color: Colors.white,
            ),
            onPressed: () => controller.setFilter(""),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey[600],
          child: const Icon(
            Icons.casino_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Modular.to.pushNamed("detailsHero",
                arguments: controller.listFiltered[
                    controller.random(controller.listFiltered.length)]);
          }
          // Modular.to.pushNamed("randomHero"),
          ),
      body: StackBody(
        body: Observer(
          builder: (BuildContext context) {
            if (controller.isLoadingSearch) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(ConstApp.colorWhitePure),
                ),
              );
            } else if (controller.heroFuture!.error != null) {
              return Center(
                child: Text(
                  "An error has occurred\n${controller.heroFuture!.error}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                  ),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: [
                    Expanded(
                      flex: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.grey[700],
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: CustomTextFormFieldWidget(
                          title: "Search by name",
                          onChanged: (val) => controller.setFilter(val),
                          corCaixa: Colors.grey,
                          isObscure: false,
                          isMaxLine: true,
                          maxLines: 1,
                          keyBoardAppearance: TextInputType.text,
                          iconsPos: Icon(Icons.search),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 2 / 2,
                        ),
                        itemCount: controller.listFiltered.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                              top: 16.0,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Modular.to.pushNamed("detailsHero",
                                    arguments: controller.listFiltered[index]);
                              },
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.9),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(
                                              0,
                                              3,
                                            ),
                                          ),
                                        ],
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: controller
                                            .listFiltered[index].images.sm,
                                        placeholder: (context, url) => Container(
                                            // width: 20,
                                            // height: 20,
                                            child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Center(
                                      child: Text(
                                        controller.listFiltered[index].name,
                                        style: ConstApp.styleGreyDark,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Center(
                                      child: Text(
                                        controller.listFiltered[index].biography
                                            .fullName,
                                        style: ConstApp.styleGreyBright,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
