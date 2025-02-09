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

  static const Routes storePage = Routes(
    RoutePaths.storePage,
    RoutePaths.storePage,
  );

  static const Routes profilePage = Routes(
    RoutePaths.homePage + RoutePaths.profilePage,
    RoutePaths.profilePage,
  );
  static const Routes educationPage = Routes(
    RoutePaths.homePage + RoutePaths.educationPage,
    RoutePaths.educationPage,
  );

  static const Routes addressPage = Routes(
    RoutePaths.homePage + RoutePaths.addressPage,
    RoutePaths.addressPage,
  );
  static const Routes fontPage = Routes(
    RoutePaths.homePage + RoutePaths.addressPage + RoutePaths.fontPage,
    RoutePaths.fontPage,
  );
  static const Routes volumePage = Routes(
    RoutePaths.homePage +
        RoutePaths.addressPage +
        RoutePaths.fontPage +
        RoutePaths.volumePage,
    RoutePaths.volumePage,
  );

  static const Routes vascularAccessPage = Routes(
    RoutePaths.homePage +
        RoutePaths.addressPage +
        RoutePaths.fontPage +
        RoutePaths.volumePage +
        RoutePaths.vascularAccessPage,
    RoutePaths.vascularAccessPage,
  );

  static const Routes weighingPage = Routes(
    RoutePaths.homePage +
        RoutePaths.addressPage +
        RoutePaths.fontPage +
        RoutePaths.volumePage +
        RoutePaths.vascularAccessPage +
        RoutePaths.weighingPage,
    RoutePaths.weighingPage,
  );

  static const Routes consumablesPage = Routes(
    RoutePaths.homePage +
        RoutePaths.volumePage +
        RoutePaths.addressPage +
        RoutePaths.fontPage +
        RoutePaths.vascularAccessPage +
        RoutePaths.consumablesPage,
    RoutePaths.consumablesPage,
  );

  static const Routes installingPage = Routes(
    RoutePaths.homePage +
        RoutePaths.addressPage +
        RoutePaths.fontPage +
        RoutePaths.volumePage +
        RoutePaths.vascularAccessPage +
        RoutePaths.weighingPage +
        RoutePaths.installingPage,
    RoutePaths.installingPage,
  );
  static const Routes preparationPage = Routes(
    RoutePaths.homePage +
        RoutePaths.addressPage +
        RoutePaths.fontPage +
        RoutePaths.volumePage +
        RoutePaths.vascularAccessPage +
        RoutePaths.weighingPage +
        RoutePaths.installingPage +
        RoutePaths.preparationPage,
    RoutePaths.preparationPage,
  );
  static const Routes physicalPreparationPage = Routes(
    RoutePaths.homePage +
        RoutePaths.addressPage +
        RoutePaths.fontPage +
        RoutePaths.volumePage +
        RoutePaths.vascularAccessPage +
        RoutePaths.weighingPage +
        RoutePaths.installingPage +
        RoutePaths.preparationPage +
        RoutePaths.physicalPreparationPage,
    RoutePaths.physicalPreparationPage,
  );

  static const Routes startProcessPage = Routes(
    RoutePaths.homePage +
        RoutePaths.addressPage +
        RoutePaths.fontPage +
        RoutePaths.volumePage +
        RoutePaths.vascularAccessPage +
        RoutePaths.weighingPage +
        RoutePaths.installingPage +
        RoutePaths.preparationPage +
        RoutePaths.physicalPreparationPage +
        RoutePaths.startProcessPage,
    RoutePaths.startProcessPage,
  );

  static const Routes treatmentPage = Routes(
    RoutePaths.homePage +
        RoutePaths.addressPage +
        RoutePaths.fontPage +
        RoutePaths.volumePage +
        RoutePaths.vascularAccessPage +
        RoutePaths.weighingPage +
        RoutePaths.installingPage +
        RoutePaths.preparationPage +
        RoutePaths.physicalPreparationPage +
        RoutePaths.startProcessPage +
        RoutePaths.treatmentPage,
    RoutePaths.treatmentPage,
  );
  static const Routes bloodReturnPage = Routes(
    RoutePaths.homePage +
        RoutePaths.addressPage +
        RoutePaths.fontPage +
        RoutePaths.volumePage +
        RoutePaths.vascularAccessPage +
        RoutePaths.weighingPage +
        RoutePaths.installingPage +
        RoutePaths.preparationPage +
        RoutePaths.physicalPreparationPage +
        RoutePaths.startProcessPage +
        RoutePaths.treatmentPage +
        RoutePaths.bloodReturnPage,
    RoutePaths.bloodReturnPage,
  );
}
