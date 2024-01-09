import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:dating_app/features/home/model/story_model.dart';
import 'package:dating_app/routers/routes.dart';
import 'package:dating_app/widgets/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class LikePage extends StatefulWidget {
  const LikePage({super.key});

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
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
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundPainter(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(5, 5),
                          blurRadius: 3,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: Colors.white12,
                          offset: Offset(-5, -5),
                          blurRadius: 3,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: IconButton(
                        onPressed: () {
                          context.go(Routes.homepage.path);
                        },
                        icon: const Icon(
                          CupertinoIcons.back,
                          size: 30,
                        )),
                  ),
                  const Spacer(),
                  const Text(
                    "Find Your Partner",
                    style: TextStyle(
                        fontSize: 35,
                        fontFamily: "Quicksand",
                        fontWeight: FontWeight.w100,
                        color: Colors.black),
                  ),
                  const Spacer()
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: screenSize.width,
                height: screenSize.height / 2.5,
                child: Swiper(
                  itemCount: story.length,
                  itemBuilder: (context, index) {
                    var data = story[index];
                    return DetailCard(
                      image: data.image,
                    );
                  },
                  viewportFraction: .77,
                  fade: 1,
                  scale: .8,
                  layout: SwiperLayout.DEFAULT,
                  itemHeight: screenSize.height,
                  itemWidth: screenSize.width,
                  axisDirection: AxisDirection.right,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailCard extends StatefulWidget {
  final String image;
  const DetailCard({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  State<DetailCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<DetailCard> {
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
          borderRadius: BorderRadius.circular(30),
          child: Stack(
            children: <Widget>[
              Container(
                width: screenSize.width,
                height: screenSize.height,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 15,
                right: 15,
                bottom: 15,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: 200,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "John, 27",
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            "📍 SAN FRANCISCO · 20 KMS AWAY",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFF56A065),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: 8,
                                    width: 8,
                                    color: const Color(0xFF56A065),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    ("Active Now"),
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
