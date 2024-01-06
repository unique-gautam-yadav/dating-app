class AppRouter {
  String name;
  String path;
  AppRouter({
    required this.name,
    required this.path,
  });
}

class Routers {
  static AppRouter loginpage = AppRouter(name: "/", path: "/");
  static AppRouter homepage = AppRouter(name: "/home", path: "/home");
}
