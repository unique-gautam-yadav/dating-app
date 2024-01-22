import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ImageCard extends StatefulWidget {
  final String image;
  const ImageCard({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
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
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  image: DecorationImage(
                    image: AssetImage(
                      widget.image,
                    ),
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
