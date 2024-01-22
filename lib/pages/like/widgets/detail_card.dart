import 'dart:ui';

import 'package:dating_app/common/models.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({
    Key? key,
    required this.person,
  }) : super(key: key);

  final PersonModel person;
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
                    image: AssetImage(person.image),
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
                          Text(
                            person.name,
                            style: const TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Iconsax.location,
                                color: Colors.white,
                                size: 12,
                              ),
                              Text(
                                " ${person.distance}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: !person.isActive
                                      ? Colors.red
                                      : const Color(0xFF56A065),
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
                                    decoration: BoxDecoration(
                                      color: !person.isActive
                                          ? Colors.red
                                          : const Color(0xFF56A065),
                                      boxShadow: [
                                        BoxShadow(
                                          color: !person.isActive
                                              ? Colors.red.withOpacity(.5)
                                              : const Color(0xFF56A065)
                                                  .withOpacity(.5),
                                          blurRadius: 5,
                                          spreadRadius: 5,
                                        ),
                                      ],
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    !person.isActive ? "Offline" : "Active Now",
                                    style: const TextStyle(
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
