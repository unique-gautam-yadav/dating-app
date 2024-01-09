import 'package:card_swiper/card_swiper.dart';
import 'package:dating_app/features/home/home_page.dart';
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
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        context.go(Routes.homepage.path);
                      },
                      icon: const Icon(
                        CupertinoIcons.back,
                        size: 30,
                      )),
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
                  layout: SwiperLayout.DEFAULT,
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
