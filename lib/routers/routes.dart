class AppRoute {
  String name;
  String path;
  AppRoute({
    required this.name,
    required this.path,
  });
}

class Routes {
  static AppRoute onboarding = AppRoute(name: "root", path: "/");
  static AppRoute navigation =
      AppRoute(name: "navigation", path: "/navigation");
  static AppRoute homepage = AppRoute(name: "home", path: "/home");
  static AppRoute likePage = AppRoute(name: 'like', path: '/like');
  static AppRoute addPage = AppRoute(name: 'add', path: '/add');
  static AppRoute chatPage = AppRoute(name: 'chat', path: '/chat');
  static AppRoute profilePage = AppRoute(name: 'profile', path: '/profile');
}
