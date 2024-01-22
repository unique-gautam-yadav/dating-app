// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:dating_app/pages/home/widgets/image_card.dart';
import 'package:dating_app/routers/routes.dart';
import 'package:dating_app/common/background_painter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              const SizedBox(height: 50),
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
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Iconsax.arrow_down_14,
                              size: 18,
                            )
                          ],
                        ),
                        Text(
                          "Discover",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w100,
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
              SizedBox(
                height: 113,
                width: double.infinity,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: story.length,
                  itemBuilder: (context, index) {
                    var data = story[index];
                    return Padding(
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
                                style: const TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          index == 0
                              ? Positioned(
                                  bottom: 35,
                                  right: 3,
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
                    );
                  },
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.pink.shade50,
                  borderRadius: BorderRadius.circular(120),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: 170,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          "Make Friends",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight:
                                flag ? FontWeight.w500 : FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.go(Routes.likePage.path);
                      },
                      child: Container(
                        width: 170,
                        decoration: BoxDecoration(
                          color: flag ? Colors.pink.shade50 : Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            "Search Partner",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight:
                                  flag ? FontWeight.bold : FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Swiper(
                        // itemWidth: constraints.maxWidth,
                        // itemHeight: constraints.maxWidth,
                        itemWidth: screenSize.width / 1.1,
                        itemHeight: screenSize.width / 1,
                        itemCount: random.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return ImageCard(
                            image: random[index],
                          );
                        },
                        layout: SwiperLayout.STACK,
                      );
                    },
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
