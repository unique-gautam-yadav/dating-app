import 'package:flutter/material.dart';

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
                color: const Color(0xFFBE8E9B).withOpacity(.3),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink.withOpacity(.3),
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
                        splashColor: const Color(0xFFBE8E9B).withOpacity(.3),
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
