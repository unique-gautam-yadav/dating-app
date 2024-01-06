import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';

class LoginAssets extends StatelessWidget {
  const LoginAssets({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.Circle,
      radius: const Radius.circular(30),
      color: Colors.pink.shade100,
      strokeWidth: 3,
      dashPattern: [20, 10],
      child: Container(
        height: 500,
        width: 500,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.pink.shade200,
                            // Colors.pink.shade100,
                            Colors.white
                          ]),
                      shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: Colors.purple.shade100,
                          shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white),
                              image: const DecorationImage(
                                  image:
                                      AssetImage("assets/images/girl1.jpeg"))),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 60,
              right: 0,
              left: 0,
              child: Container(
                height: 50,
                width: 50,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/girl2.jpeg"))),
              ),
            ),
            Positioned(
              top: 170,
              right: 0,
              left: 230,
              child: Container(
                height: 50,
                width: 50,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/boy1.jpeg"))),
              ),
            ),
            Positioned(
              bottom: 100,
              right: 300,
              left: 0,
              child: Container(
                height: 60,
                width: 60,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/boy.jpeg"))),
              ),
            ),
            Positioned(
              bottom: 50,
              right: 0,
              left: 200,
              child: Container(
                height: 60,
                width: 60,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/girl3.jpeg"))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
