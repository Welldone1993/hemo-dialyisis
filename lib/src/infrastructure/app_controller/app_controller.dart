import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../pages/shared/model/setting_model.dart';

class AppController {
  factory AppController() => _instance;

  AppController._();

  static final AppController _instance = AppController._();

  final Rxn<SettingModel> setting = Rxn<SettingModel>();

  final storage = GetStorage();

  void initializeApp() {
    setting.value = SettingModel(
      titleFontSize: 12,
      valueFontSize: 20,
    );
  }
}
