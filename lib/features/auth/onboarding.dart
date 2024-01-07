import 'package:dating_app/common/common.dart';
import 'package:dating_app/routers/router.dart';
import 'package:dating_app/widgets/common_widgets.dart';
import 'package:dating_app/widgets/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
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
              TextSpan(text: "Love", style: common.mainPink),
              TextSpan(text: " never checks the", style: common.mainBlack)
            ])),
            Text(
              "clock. Start your ",
              style: common.mainBlack,
            ),
            RichText(
                text: TextSpan(children: <InlineSpan>[
              TextSpan(text: "journey", style: common.mainPink),
              TextSpan(text: " today.", style: common.mainBlack)
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
                  context.go(Routes.homepage.path);
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
                  GoRouter.of(context).pushNamed(Routes.navigation.name);
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
                const Spacer(),
                const Text("Don't have a account?",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Quicksand",
                        fontWeight: FontWeight.w800,
                        color: Colors.black)),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "  Signup",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Quicksand",
                      fontWeight: FontWeight.w800,
                      color: Colors.pink.shade300,
                    ),
                  ),
                ),
                const Spacer()
              ],
            )
          ],
        ),
      ),
    );
  }
}
