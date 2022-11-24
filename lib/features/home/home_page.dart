import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:shakes_app/features/home/widgets/drink_menu_item.dart';
import 'package:shakes_app/features/home/widgets/shake_widget.dart';
import 'package:shakes_app/models/drink.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  List<String> _shakes = [
    "assets/shake.png",
    "assets/shake1.png",
    "assets/shake2.png",
    "assets/shake3.png",
    "assets/shake4.webp",
  ];
  List<Drink> drinks = [
    Drink(name: "Soft", id: 1),
    Drink(name: "Shake", id: 2),
    Drink(name: "Cocktails", id: 3),
    Drink(name: "Coffees", id: 4),
  ];
  Drink _drinkSelected = Drink(name: "Soft", id: 1);

  bool _shakeSelected = true;
  bool _coffeeSelected = false;
  bool _cocktailsSelected = false;
  bool _softSelected = false;
  int _itemNumber = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        new AnimationController(duration: Duration(seconds: 5), vsync: this)
          ..addListener(() => setState(() {}));
    animation = Tween(begin: -200.0, end: 200.0).animate(controller);
    handleAnimation();
  }

  Future<void> handleAnimation() async {
    while (true) {
      await controller.forward();
      await controller.reverse();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.brown,
      body: Container(
        padding: EdgeInsets.only(top: 70, left: 15, right: 15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(255, 153, 33, 53).withOpacity(1),
              Color(0xFF521f26),
            ])),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: Transform.translate(
                offset: Offset(
                  animation.value,
                  animation.value,
                ),
                child: BlurryContainer(
                  height: 150,
                  width: 150,
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.red.withOpacity(.2),
                  blur: 2,
                  child: Container(),
                ),
              ),
            ),
            Positioned(
              bottom: 60,
              left: 150,
              child: Bounce(
                child: Transform.translate(
                  offset: Offset(animation.value * -1, animation.value * -1),
                  child: BlurryContainer(
                    height: 150,
                    width: 150,
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.red.withOpacity(.2),
                    blur: 2,
                    child: Container(),
                  ),
                ),
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome, Abdul!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "SHAKES",
                  style: TextStyle(
                      color: Colors.white.withOpacity(.8),
                      fontSize: 25,
                      fontFamily: "Electrolize",
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: "Search",
                      contentPadding: EdgeInsets.only(left: 10),
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.search,
                          color: Colors.brown,
                          size: 30,
                        ),
                      )),
                ),
              ),

// * side bar and shakes items
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .7,
                      // color: Colors.black,
                      width: 300,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            // Padding(
                            //   padding: const EdgeInsets.all(0),
                            //   child: Align(
                            //     alignment: Alignment.centerLeft,
                            //     child: SizedBox(
                            //       height: 200,
                            //       child: ListView.separated(
                            //           scrollDirection: Axis.horizontal,
                            //           shrinkWrap: true,
                            //           itemBuilder: (context, index) {
                            //             final drink = drinks[index];
                            //             return DrinkMenuItem(
                            //                 title: drink.name,
                            //                 isSelected:
                            //                     drink == _drinkSelected);
                            //           },
                            //           separatorBuilder: (_, __) => SizedBox(
                            //                 width: 20,
                            //               ),
                            //           itemCount: drinks.length),
                            //     ),
                            //   ),
                            // ),

                            Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 1,
                                  color: Colors.white,
                                ),
                                Container(
                                  height: 100,
                                  width: 1,
                                  color: Colors.yellow,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                            height: 500,
                                            width: 250,
                                            child: ListWheelScrollView(
                                              onSelectedItemChanged: (a) {
                                                print(a);
                                              },
                                              itemExtent: 250,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    print("Hel");
                                                  },
                                                  child: ShakeWidget(
                                                    shakes: "Mix shake",
                                                    shakesImg: _shakes[0],
                                                    price: "543",
                                                  ),
                                                ),
                                                ShakeWidget(
                                                  shakes: "Soft shake",
                                                  shakesImg: _shakes[1],
                                                  price: "342",
                                                ),
                                                ShakeWidget(
                                                  shakes: "Mech Shake",
                                                  shakesImg: _shakes[2],
                                                  price: "234",
                                                ),
                                                ShakeWidget(
                                                  shakes: "Berry Juice",
                                                  shakesImg: _shakes[3],
                                                  price: "542",
                                                ),
                                                ShakeWidget(
                                                  shakes: "Milk Juice",
                                                  shakesImg: _shakes[4],
                                                  price: "542",
                                                ),
                                              ],
                                            )))
                                  ],
                                ),
                              ],
                            ),

                            // * shakes list
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // * items list
              )
            ]),
          ],
        ),
      ),
    );
  }
}
