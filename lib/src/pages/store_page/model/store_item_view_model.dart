class StoreItemViewModel {
  final int id;
  final String title;
  final String image;
  final String price;
  final double rate;
  final int rateCount;
  final String company;
  final bool hasDelivery;
  final bool hasDiscount;
  final String? volume;

  StoreItemViewModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.rate,
    required this.rateCount,
    required this.company,
    required this.hasDelivery,
    required this.hasDiscount,
    this.volume,
  });
}
