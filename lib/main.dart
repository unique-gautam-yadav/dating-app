import 'package:dating_app/routers/router_config.dart';
import 'package:flutter/material.dart';

/*


<Insta>
  flutter.demon
  flutter.spirit
</Insta>

<GitHub>
  @unique-gautam-yadav
  @Aditya-Thakur-369
</GitHub>


 */

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFBF4FC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
          // brightness: Brightness.dark,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
    );
  }
}
