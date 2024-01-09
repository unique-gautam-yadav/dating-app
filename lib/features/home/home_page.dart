// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:dating_app/features/home/model/story_model.dart';
import 'package:dating_app/routers/routes.dart';
import 'package:dating_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

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

  int selectedItem = 0;
  bool flag = true;

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
                        Row(
                          children: [
                            Text(
                              "Amsterdam",
                              style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: "Quicksand-Bold",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Iconsax.arrow_down_14,
                              color: Colors.black,
                              size: 18,
                            )
                          ],
                        ),
                        Text(
                          "Discover",
                          style: TextStyle(
                            fontSize: 32,
                            fontFamily: "Quicksand",
                            fontWeight: FontWeight.w100,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    IconButton.filled(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Colors.white.withOpacity(0.5),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Iconsax.notification,
                        color: Colors.black,
                      ),
                    ),
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
                          selectedItem = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade300,
                                        blurRadius: 1,
                                        blurStyle: BlurStyle.inner,
                                        spreadRadius: 2,
                                      )
                                    ],
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: Image.asset(
                                        data.image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  data.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Quicksand",
                                    // fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
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
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.pink.shade50,
                  borderRadius: BorderRadius.circular(120),
                ),
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
                          color: !flag ? Colors.pink.shade50 : Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
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
                        // setState(() {
                        //   flag = false;

                        // });
                        context.go(Routes.likePage.path);
                      },
                      child: AnimatedContainer(
                        height: 40,
                        width: 170,
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          color: flag ? Colors.pink.shade50 : Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
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
  const ImageCard({
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
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
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
