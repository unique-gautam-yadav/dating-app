import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../pages/add_page.dart';
import '../pages/onboarding/onboarding.dart';
import '../pages/chat_screen.dart';
import '../pages/home/home_page.dart';
import '../pages/like/like_page.dart';
import '../pages/profile_page.dart';
import '../pages/navigation.dart';
import 'routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: Routes.onboarding.path,
      name: Routes.onboarding.name,
      pageBuilder: (context, state) {
        return const CupertinoPage(child: OnboardingPage());
      },
    ),
    // GoRoute(
    //   parentNavigatorKey: _rootNavigatorKey,
    //   path: Routes.navigation.path,
    //   name: Routes.navigation.name,
    //   pageBuilder: (context, state) {
    //     return const CupertinoPage(
    //       child: NavigationPage(),
    //     );
    //   },
    // ),
    // GoRoute(
    //   parentNavigatorKey: _rootNavigatorKey,
    //   path: Routes.homepage.path,
    //   name: Routes.homepage.name,
    //   pageBuilder: (context, state) {
    //     return const CupertinoPage(
    //       child: HomePage(),
    //     );
    //   },
    // ),
    ShellRoute(
      parentNavigatorKey: _rootNavigatorKey,
      navigatorKey: _shellNavigatorKey,
      pageBuilder: (context, state, child) {
        int index = 0;

        if (state.fullPath == Routes.likePage.path) {
          index = 1;
        }
        if (state.fullPath == Routes.addPage.path) {
          index = 2;
        }
        if (state.fullPath == Routes.chatPage.path) {
          index = 3;
        }
        if (state.fullPath == Routes.profilePage.path) {
          index = 4;
        }

        return CupertinoPage(
          child: RootPage(
            selectedIndex: index,
            child: child,
          ),
        );
      },
      routes: [
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          name: Routes.homepage.name,
          path: Routes.homepage.path,
          pageBuilder: (context, state) => const CupertinoPage(
            child: HomePage(),
          ),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          name: Routes.likePage.name,
          path: Routes.likePage.path,
          pageBuilder: (context, state) => const CupertinoPage(
            child: LikePage(),
          ),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          name: Routes.addPage.name,
          path: Routes.addPage.path,
          pageBuilder: (context, state) => const CupertinoPage(
            child: AddPage(),
          ),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          name: Routes.chatPage.name,
          path: Routes.chatPage.path,
          pageBuilder: (context, state) => const CupertinoPage(
            child: ChatPage(),
          ),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          name: Routes.profilePage.name,
          path: Routes.profilePage.path,
          pageBuilder: (context, state) => const CupertinoPage(
            child: ProfilePage(),
          ),
        ),
      ],
    ),
  ],
);
