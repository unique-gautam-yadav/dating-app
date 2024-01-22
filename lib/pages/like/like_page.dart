// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:card_swiper/card_swiper.dart';
import 'package:dating_app/pages/like/widgets/big_button.dart';
import 'package:dating_app/pages/like/widgets/detail_card.dart';
import 'package:dating_app/pages/like/widgets/small_button.dart';
import 'package:dating_app/routers/routes.dart';
import 'package:dating_app/common/background_painter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../common/data.dart';

class LikePage extends StatefulWidget {
  const LikePage({super.key});

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundPainter(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(height: 80),
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
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      const Spacer()
                    ],
                  ),
                  const SizedBox(height: 80),
                  SizedBox(
                    width: screenSize.width,
                    height: screenSize.height / 2.2,
                    child: Swiper(
                      // controller: ,
                      itemCount: persons.length,
                      itemBuilder: (context, index) {
                        var data = persons[index];
                        return DetailCard(
                          person: data,
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
              const Positioned(
                bottom: 120,
                left: 50,
                child: SmallButton(
                  isLeft: true,
                  icon: Iconsax.close_square,
                ),
              ),
              const Positioned(
                bottom: 120,
                right: 50,
                child: SmallButton(
                  icon: Iconsax.messages_3,
                  isLeft: false,
                ),
              ),
              const Positioned(
                bottom: 190,
                left: 0,
                right: 0,
                child: BigLikeButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
