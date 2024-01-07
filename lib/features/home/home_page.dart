// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:dating_app/features/home/model/story_model.dart';
import 'package:dating_app/widgets/common_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<StoryModel> story = [
    StoryModel(name: "Your Story", image: "assets/images/girl1.jpeg"),
    StoryModel(name: "Ben", image: "assets/images/girl3.jpeg"),
    StoryModel(name: "Lucie", image: "assets/images/girl2.jpeg"),
    StoryModel(name: "Marry", image: "assets/images/boy1.avif"),
    StoryModel(name: "Sunny", image: "assets/images/girl1.jpeg"),
    StoryModel(name: "Ben", image: "assets/images/girl3.jpeg"),
    StoryModel(name: "Lucie", image: "assets/images/girl2.jpeg"),
    StoryModel(name: "Marry", image: "assets/images/boy1.avif"),
  ];

  int selecteditem = 0;
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      body: CustomPaint(
        painter: BackgroundPainter(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          " Amsterdam",
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: "Quicksand-Bold",
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          "Discover",
                          style: TextStyle(
                              fontSize: 40,
                              fontFamily: "Quicksand",
                              fontWeight: FontWeight.w100,
                              color: Colors.black),
                        )
                      ],
                    ),
                    IconButton.filled(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Colors.white.withOpacity(0.5))),
                        onPressed: () {},
                        icon: const Icon(
                          Iconsax.notification,
                          color: Colors.black,
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 150,
                width: 600,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: story.length,
                  itemBuilder: (context, index) {
                    var data = story[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selecteditem = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      height: 80,
                                      width: 80,
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                          // border: Border.all(color: Colors.white),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade300,
                                                blurRadius: 1,
                                                blurStyle: BlurStyle.inner,
                                                spreadRadius: 5)
                                          ],
                                          shape: BoxShape.circle),
                                      child: Padding(
                                          padding: const EdgeInsets.all(3),
                                          child: CircleAvatar(
                                            radius: 40,
                                            backgroundImage:
                                                AssetImage(data.image),
                                          ))),
                                  Text(
                                    data.name,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontFamily: "Quicksand",
                                        fontWeight: FontWeight.w200,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                              index == 0
                                  ? Positioned(
                                      bottom: 60,
                                      right: 0,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.pink.shade600,
                                        radius: 12,
                                        child: const Icon(
                                          Iconsax.add,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ))
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          flag = true;
                        });
                      },
                      child: AnimatedContainer(
                        height: 40,
                        width: 170,
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              flag
                                  ? BoxShadow(
                                      blurRadius: 0,
                                      blurStyle: BlurStyle.inner,
                                      spreadRadius: 10,
                                      color: Colors.pink.shade50)
                                  : BoxShadow(
                                      blurRadius: 0,
                                      blurStyle: BlurStyle.inner,
                                      spreadRadius: 0,
                                      color: Colors.pink.shade50)
                            ]),
                        child: Center(
                            child: Text(
                          "Make Friends",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Quicksand",
                              fontWeight:
                                  flag ? FontWeight.w500 : FontWeight.bold,
                              color: Colors.black),
                        )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          flag = false;
                        });
                      },
                      child: AnimatedContainer(
                        height: 40,
                        width: 170,
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              flag
                                  ? BoxShadow(
                                      blurRadius: 0,
                                      blurStyle: BlurStyle.inner,
                                      spreadRadius: 0,
                                      color: Colors.pink.shade50)
                                  : BoxShadow(
                                      blurRadius: 0,
                                      blurStyle: BlurStyle.inner,
                                      spreadRadius: 10,
                                      color: Colors.pink.shade50)
                            ]),
                        child: Center(
                            child: Text(
                          "Search Partner",
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: "Quicksand",
                              fontWeight:
                                  flag ? FontWeight.bold : FontWeight.w400,
                              color: Colors.black),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: screenSize.width / 1,
                height: screenSize.height / 2,
                child: Swiper(
                  itemCount: story.length,
                  itemBuilder: (context, index) {
                    var data = story[index];
                    return ImageCard(
                      image: data.image,
                    );
                  },
                  layout: SwiperLayout.TINDER,
                  itemHeight: screenSize.height,
                  itemWidth: screenSize.width,
                  axisDirection: AxisDirection.right,
                  // pagination: const SwiperPagination(),
                  transformer: ScaleAndFadeTransformer(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final String image;
  ImageCard({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: SizedBox(
        width: screenSize.width,
        height: screenSize.height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Stack(
            children: <Widget>[
              Container(
                width: screenSize.width,
                height: screenSize.height,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(40.0),
                  //     topRight: Radius.circular(40.0),
                  //     bottomLeft: Radius.circular(40.0),
                  //     bottomRight: Radius.circular(40.0)),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  image: DecorationImage(
                    // image: AssetImage('assets/images/girl2.jpeg'),
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(30)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        border: Border(
                          top: BorderSide(
                            color: Colors.white.withOpacity(.8),
                            width: 2.3,
                          ),
                          left: BorderSide(
                            color: Colors.white.withOpacity(.8),
                            width: 2.3,
                          ),
                          right: BorderSide(
                            color: Colors.white.withOpacity(.8),
                            width: 2.3,
                          ),
                        ),
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                      height: 65,
                      width: 200,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.4),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Iconsax.like_15,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.4),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Iconsax.more,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.4),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Iconsax.message_favorite5,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
