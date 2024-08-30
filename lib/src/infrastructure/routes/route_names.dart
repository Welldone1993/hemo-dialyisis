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
    RoutePaths.homePage + RoutePaths.volumePage,
    RoutePaths.volumePage,
  );

  static const Routes fontPage = Routes(
    RoutePaths.homePage + RoutePaths.volumePage + RoutePaths.fontPage,
    RoutePaths.fontPage,
  );
  static const Routes vascularAccessPage = Routes(
    RoutePaths.homePage +
        RoutePaths.volumePage +
        RoutePaths.fontPage +
        RoutePaths.vascularAccessPage,
    RoutePaths.vascularAccessPage,
  );

  static const Routes consumablesPage = Routes(
    RoutePaths.homePage +
        RoutePaths.volumePage +
        RoutePaths.fontPage +
        RoutePaths.vascularAccessPage +
        RoutePaths.consumablesPage,
    RoutePaths.consumablesPage,
  );
}
