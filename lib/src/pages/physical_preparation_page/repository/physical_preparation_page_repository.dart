import '../model/physical_preparation_item_model.dart';

class PhysicalPreparationPageRepository {
  List<PhysicalPreparationItemModel> getInstallingItems() => [
        PhysicalPreparationItemModel(
          id: 7,
          title: 'بست های خون خروجی و ورودی را باز کنید.',
        ),
        PhysicalPreparationItemModel(
          id: 6,
          title: 'انتهای قرمز رنگ ست شریانی را به محل بازگشت خون وارد کنید.',
        ),
        PhysicalPreparationItemModel(
          id: 5,
          title: 'انتهای آبی ست شریانی را به محل خروج خون وارد کنید.',
        ),
        PhysicalPreparationItemModel(
          id: 4,
          title: 'محل دسترسی عروقی خود را ضد عفونی کنید.',
        ),
        PhysicalPreparationItemModel(
          id: 3,
          title: 'دستگاه و دستهای خود را با الکل و گاز استریل ضد عفونی کنید.',
        ),
        PhysicalPreparationItemModel(
          id: 2,
          title: 'ماسک و دستکش استفاده کنید.',
        ),
        PhysicalPreparationItemModel(
          id: 1,
          title: 'دستگاه فشار سنج را به بازوی خود ببندید.',
        ),
      ];
}
