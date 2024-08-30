import 'route_paths.dart';

class Routes {
  final String uri;
  final String path;

  const Routes(this.uri, [final String? path]) : path = path ?? uri;
}

class HemoDialysisRouteNames extends Routes {
  HemoDialysisRouteNames(super.uri);

  /// home Page
  static const Routes homePage = Routes(
    RoutePaths.homePage,
    RoutePaths.homePage,
  );

  static const Routes volumePage = Routes(
    RoutePaths.homePage + RoutePaths.volumePage ,
    RoutePaths.volumePage,
  );
}
