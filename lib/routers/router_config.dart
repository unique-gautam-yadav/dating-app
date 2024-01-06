import 'package:dating_app/routers/router.dart';
import 'package:dating_app/screens/home_page.dart';
import 'package:dating_app/screens/login_page.dart';
import 'package:dating_app/screens/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: Routers.loginpage.path,
    name: Routers.loginpage.name,
    pageBuilder: (context, state) {
      return const CupertinoPage(child: LoginPage());
    },
  ),
  GoRoute(path: Routers.navigation.path,name: Routers.navigation.name,pageBuilder: (context, state) {
    return CupertinoPage(child: NavigationPage());
  },),
  GoRoute(
    path: Routers.homepage.path,
    name: Routers.homepage.name,
    pageBuilder: (context, state) {
      return const CupertinoPage(child: HomePage());
    },
  ),
]);
