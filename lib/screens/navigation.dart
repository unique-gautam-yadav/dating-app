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
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(80),
                  border: Border.all(color: Colors.purpleAccent.shade100),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 30,
                      color: Colors.pink.shade200,
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
                      selectedIndex == 3 ? Iconsax.message5 : Iconsax.message,
                      selectedIndex == 4 ? Iconsax.user : Iconsax.user,
                    ],
                    currentIndex: selectedIndex,
                    onItemTap: (index) => context.go(_indexToTab(index)),
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

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
    required this.icons,
    required this.currentIndex,
    required this.onItemTap,
    required this.selectedColor,
    required this.colors,
  });

  final List<IconData> icons;
  final int currentIndex;
  final void Function(int index) onItemTap;
  final Color selectedColor;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      double lineSize = constraints.maxWidth / icons.length;
      return Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: AnimatedContainer(
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 350),
              margin: EdgeInsets.only(left: currentIndex * lineSize),
              height: 80,
              width: lineSize,
              decoration: BoxDecoration(
                color: const Color(0xFFBE8E9B),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.pink,
                    blurRadius: 10,
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: icons.map(
                (e) {
                  int index = icons.indexOf(e);
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: (lineSize - 48) / 2),
                    child: SizedBox(
                      width: 48,
                      child: MaterialButton(
                        elevation: 0,
                        minWidth: 10,
                        height: 45,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        splashColor: const Color(0xFFBE8E9B),
                        highlightColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        onPressed: currentIndex == index
                            ? null
                            : () {
                                onItemTap(index);
                              },
                        child: Icon(
                          e,
                          color: currentIndex == index ? selectedColor : colors,
                          size: 30,
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      );
    });
  }
}



// class NavigationPage extends StatefulWidget {
//   const NavigationPage({super.key});

//   @override
//   State<NavigationPage> createState() => _NavigationPageState();
// }

// class _NavigationPageState extends State<NavigationPage> {
//   int selectedScreen = 0;
//   @override
//   Widget build(BuildContext context) {
//     // List<String> icons = [
//     //   "assets/images/home_black.png",
//     //   "assets/images/heart_black.png",
//     //   "assets/images/plus.png",
//     //   "assets/images/comment_black.png",
//     //   "assets/images/girl_profile.jpeg"
//     // ];
//     List<Widget> screens = [
//       const HomePage(),
//       const Center(
//         child: Text("Heart Page "),
//       ),
//       const Center(
//         child: Text("add Page "),
//       ),
//       const Center(
//         child: Text("message Page "),
//       ),
//       const Center(
//         child: Text("Avatar Page "),
//       )
//     ];
//     return Scaffold(
//       bottomNavigationBar: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Container(
//             // margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(80),
//               border: Border.all(color: Colors.purpleAccent.shade100),
//               boxShadow: [
//                 BoxShadow(
//                   blurRadius: 30,
//                   color: Colors.pink.shade200,
//                   blurStyle: BlurStyle.normal,
//                   spreadRadius: 2,
//                   offset: const Offset(
//                     0,
//                     7,
//                   ),
//                 ),
//               ],
//             ),
//             child: GNav(
//               selectedIndex: selectedScreen,
//               rippleColor: const Color(0xFFBE8E9B),
//               gap: 8,
//               activeColor: Colors.white,
//               iconSize: 24,
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//               duration: const Duration(milliseconds: 400),
//               tabBackgroundColor: const Color(0xFFBE8E9B),
//               color: Colors.pink,
//               tabActiveBorder: Border.all(
//                 color: Colors.white,
//               ),
//               tabs: [
//                 GButton(
//                   icon: Iconsax.home5,
//                   shadow: selectedScreen == 0
//                       ? [
//                           const BoxShadow(
//                             color: Colors.pink,
//                             blurRadius: 10,
//                           ),
//                         ]
//                       : [],
//                 ),
//                 const GButton(
//                   icon: Iconsax.heart5,
//                 ),
//                 const GButton(
//                   icon: Iconsax.add,
//                 ),
//                 const GButton(
//                   icon: Iconsax.messages_15,
//                 ),
//                 GButton(
//                   padding: const EdgeInsets.all(2),
//                   leading: SizedBox(
//                     height: 35,
//                     width: 35,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(20),
//                       child: Image.asset(
//                         'assets/images/girl1.jpeg',
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   icon: Icons.email,
//                 ),
//               ],
//               onTabChange: (value) {
//                 setState(() {
//                   selectedScreen = value;
//                 });
//               },
//             ),
//           ),
//         ),
//       ),
//       body: screens[selectedScreen],
//     );
//   }
// }
