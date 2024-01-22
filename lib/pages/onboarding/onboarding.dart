import 'package:dating_app/common/background_painter.dart';
import 'package:dating_app/routers/routes.dart';
import 'package:dating_app/pages/onboarding/widgets/rotating_images.dart';
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
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundPainter(),
        size: MediaQuery.sizeOf(context),
        child: Column(
          children: [
            const LoginAssets(),
            // const RotatedIcons(),
            RichText(
              text: TextSpan(
                children: <InlineSpan>[
                  TextSpan(text: "Love", style: mainPink),
                  TextSpan(text: " never checks the", style: mainBlack)
                ],
              ),
            ),
            Text(
              "clock. Start your ",
              style: mainBlack,
            ),
            RichText(
              text: TextSpan(
                children: <InlineSpan>[
                  TextSpan(text: "journey", style: mainPink),
                  TextSpan(text: " today.", style: mainBlack)
                ],
              ),
            ),
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

Color mainColor = const Color(0xFFAF8994);
TextStyle mainPink = TextStyle(
    fontSize: 35,
    fontFamily: "Quicksand",
    fontWeight: FontWeight.bold,
    color: Colors.pink.shade200);
TextStyle mainBlack = const TextStyle(
    fontSize: 35,
    fontFamily: "Quicksand",
    fontWeight: FontWeight.w400,
    color: Colors.black);
