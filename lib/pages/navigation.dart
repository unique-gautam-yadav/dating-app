import 'dart:ui';

import 'package:dating_app/common/custom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../routers/routes.dart';

class RootPage extends StatelessWidget {
  const RootPage({
    Key? key,
    required this.child,
    required this.selectedIndex,
  }) : super(key: key);

  final Widget child;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: selectedIndex == 0,
      onPopInvoked: (didPop) {
        if (selectedIndex != 0) {
          context.go(Routes.homepage.path);
        }
      },
      child: Stack(
        children: [
          child,
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.3),
                        borderRadius: BorderRadius.circular(80),
                        border: Border.all(color: Colors.purpleAccent.shade100),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 30,
                            color: Colors.pink.withOpacity(.2),
                            blurStyle: BlurStyle.normal,
                            spreadRadius: 2,
                            offset: const Offset(
                              0,
                              7,
                            ),
                          ),
                        ],
                      ),
                      child: SizedBox(
                        height: 50,
                        child: CustomNavBar(
                          colors: Colors.pink,
                          selectedColor: Colors.white,
                          icons: [
                            selectedIndex == 0 ? Iconsax.home5 : Iconsax.home_1,
                            selectedIndex == 1 ? Iconsax.heart5 : Iconsax.heart,
                            selectedIndex == 2 ? Iconsax.add : Iconsax.add,
                            selectedIndex == 3
                                ? Iconsax.message5
                                : Iconsax.message,
                            selectedIndex == 4 ? Iconsax.user : Iconsax.user,
                          ],
                          currentIndex: selectedIndex,
                          onItemTap: (index) => context.go(_indexToTab(index)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _indexToTab(int index) {
    switch (index) {
      case 0:
        return Routes.homepage.path;
      case 1:
        return Routes.likePage.path;
      case 2:
        return Routes.addPage.path;
      case 3:
        return Routes.chatPage.path;
      case 4:
        return Routes.profilePage.path;
      default:
        return Routes.homepage.path;
    }
  }
}
