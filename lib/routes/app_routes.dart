abstract class Routes {
  Routes._();
  static const root = PathsRoute.root;
  static const loadScreen = PathsRoute.loadScreen;
  static const homeScreen = PathsRoute.homeScreen;
  static const counterScreen = PathsRoute.counterScreen;
  static const loginScreen = PathsRoute.loginScreen;
}

abstract class PathsRoute {
  PathsRoute._();
  static const root = '/';
  static const loadScreen = '/load_screen';
  static const homeScreen = '/home';
  static const counterScreen = '/counter';
  static const loginScreen = '/loginScreen';
}
