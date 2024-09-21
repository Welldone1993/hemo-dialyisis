import '../model/installing_item_model.dart';

class InstallingPageRepository {
  List<InstallingItemModel> getInstallingItems() => [
        InstallingItemModel(
          id: 6,
          title:
              'ابتدا بطری های مایعات را در محل نشان داده شده در تصویر قرار دهید.',
        ),
        InstallingItemModel(
          id: 5,
          title: 'دستگاه و دستهای خود را با الکل و گاز استریل ضد عفونی کنید.',
        ),
        InstallingItemModel(
          id: 4,
          title:
              'ست دیالیز را در دستگاه قرار دهید و به محفظه مایعات متصل کنید.',
        ),
        InstallingItemModel(
          id: 3,
          title: 'صافی دیالیز را به ست دیالیز متصل کنید و در جای خود نصب کنید.',
        ),
        InstallingItemModel(
          id: 2,
          title: 'ست شریانی را به صافی دیالیز و محلول سالین متصل کنید.',
        ),
        InstallingItemModel(
          id: 1,
          title: 'هپارین را به پمپ هپارین متصل کنید.',
        ),
      ];
}
