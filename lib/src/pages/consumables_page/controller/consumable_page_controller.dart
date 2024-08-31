import 'package:get/get.dart';
import 'package:hemo_dialysis/src/pages/consumables_page/model/consumable_model.dart';

class ConsumablesPageController extends GetxController {
  final List<ConsumableModel> medicines = [
    ConsumableModel(id: 4, name: 'هپارین'),
    ConsumableModel(id: 3, name: 'بافر'),
    ConsumableModel(id: 2, name: 'محلول سالین'),
    ConsumableModel(id: 1, name: 'محلول دیالیز'),
  ];
  final List<ConsumableModel> consumables = [
    ConsumableModel(id: 7, name: 'صافی'),
    ConsumableModel(id: 6, name: 'ست مایعات'),
    ConsumableModel(id: 5, name: 'ست وریدی'),
  ];
  final List<ConsumableModel> disinfectionSupplies = [
    ConsumableModel(id: 12, name: 'محلول ضدعفونی کننده'),
    ConsumableModel(id: 11, name: 'دستکش جراحی'),
    ConsumableModel(id: 10, name: 'ماسک'),
    ConsumableModel(id: 9, name: 'گاز استریل'),
    ConsumableModel(id: 8, name: 'دستمال مرطوب'),
  ];

  final List<ConsumableModel> other = [
    ConsumableModel(id: 14, name: 'قیچی'),
    ConsumableModel(id: 13, name: 'چسب'),
  ];
}
