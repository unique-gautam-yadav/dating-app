import 'dart:ui';

import 'package:dating_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:card_swiper/card_swiper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      body: CustomPaint(
        painter: BackgroundPainter(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: screenSize.width / 1,
                height: screenSize.height / 2,
                child: Swiper(
                  itemCount: 10,
                  itemBuilder: (context, index) => const ImageCard(),
                  layout: SwiperLayout.TINDER,
                  itemHeight: screenSize.height / 2.2,
                  itemWidth: screenSize.width / 1.2,
                  axisDirection: AxisDirection.right,
                  pagination: const SwiperPagination(),
                  transformer: ScaleAndFadeTransformer(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);
    return Card(
      color: Colors.transparent,
      elevation: 4.0,
      child: SizedBox(
        width: screenSize.width / 1.2,
        height: screenSize.height / 2.2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: <Widget>[
              Container(
                width: screenSize.width / 1.2,
                height: screenSize.height / 2.2,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0)),
                  image: DecorationImage(
                    image: AssetImage('assets/images/girl1.jpeg'),
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
