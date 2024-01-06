import 'package:dating_app/common/common.dart';
import 'package:dating_app/routers/router.dart';
import 'package:dating_app/widgets/common_widgets.dart';
import 'package:dating_app/widgets/dotted_border.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Common common = Common();
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundPainter(),
        size: MediaQuery.sizeOf(context),
        child: Column(
          children: [
            const LoginAssets(),
            RichText(
                text: TextSpan(children: <InlineSpan>[
              TextSpan(text: "Love", style: common.mainpink),
              TextSpan(text: " never checks the", style: common.mainblack)
            ])),
            Text(
              "clock. Start your ",
              style: common.mainblack,
            ),
            RichText(
                text: TextSpan(children: <InlineSpan>[
              TextSpan(text: "journey", style: common.mainpink),
              TextSpan(text: " today.", style: common.mainblack)
            ])),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    fixedSize: MaterialStatePropertyAll(Size(380, 60)),
                    elevation: MaterialStatePropertyAll(0)),
                onPressed: () {
                  GoRouter.of(context).pushNamed(Routers.navigation.name);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Spacer(),
                    Image.asset(
                      "assets/images/google_logo.png",
                      height: 30,
                      width: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Log in with Google",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
                    const Spacer()
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black),
                    fixedSize: MaterialStatePropertyAll(Size(380, 60)),
                    elevation: MaterialStatePropertyAll(0)),
                onPressed: () {
                  GoRouter.of(context).pushNamed(Routers.navigation.name);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Spacer(),
                    Image.asset(
                      "assets/images/apple_logo.png",
                      height: 30,
                      width: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Log in with Apple",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                    const Spacer()
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Spacer(),
                const Text("Don't have a accout?",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Quicksand",
                        fontWeight: FontWeight.w800,
                        color: Colors.black)),
                TextButton(
                    onPressed: () {},
                    child: Text("  Signup",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Quicksand",
                            fontWeight: FontWeight.w800,
                            color: Colors.pink.shade300))),
                Spacer()
              ],
            )
          ],
        ),
      ),
    );
  }
}
