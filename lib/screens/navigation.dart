import 'package:dating_app/common/common.dart';
import 'package:dating_app/screens/home_page.dart';
import 'package:dating_app/widgets/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int selectedscreen = 0;
  @override
  Widget build(BuildContext context) {
    List<String> icons = [
      "assets/images/home_black.png",
      "assets/images/heart_black.png",
      "assets/images/plus.png",
      "assets/images/comment_black.png",
      "assets/images/girl_profile.jpeg"
    ];
    List<Widget> screens = [
      HomePage(),
      Center(
        child: Text("Heart Page "),
      ),
      Center(
        child: Text("add Page "),
      ),
      Center(
        child: Text("message Page "),
      ),
      Center(
        child: Text("Avatar Page "),
      )
    ];
    return Scaffold(
      bottomNavigationBar: Material(
        child: Container(
          margin: EdgeInsets.only(bottom: 30, left: 20, right: 20),
          height: 90,
          width: 300,
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
                    offset: Offset(
                      0,
                      7,
                    ))
              ]),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            itemCount: icons.length,
            itemBuilder: (context, index) {
              var data = icons[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedscreen = index;
                    });
                  },
                  child: AnimatedContainer(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      duration: Duration(milliseconds: 300),
                      width: 40,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: index == selectedscreen
                                  ? Colors.pink.shade300
                                  : index == selectedscreen
                                      ? Colors.transparent
                                      : Colors.white),
                          shape: BoxShape.circle,
                          color: index == selectedscreen
                              ? Common().maincolor
                              : Colors.white),
                      child: Image.asset(
                        data,
                        color: index == selectedscreen
                            ? Colors.white
                            : index == 4
                                ? Colors.transparent
                                : Colors.pink.shade200,
                        height: 20,
                        width: 20,
                      )),
                ),
              );
            },
          ),
        ),
      ),
      body: screens[selectedscreen],
    );
  }
}
