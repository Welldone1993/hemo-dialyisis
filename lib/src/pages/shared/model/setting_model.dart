class SettingModel {
  final double titleFontSize;
  final double valueFontSize;

  SettingModel({
    required this.titleFontSize,
    required this.valueFontSize,
  });

  SettingModel copyWith({
    final double? titleFontSize,
    final double? valueFontSize,
  }) =>
      SettingModel(
        titleFontSize: titleFontSize ?? this.titleFontSize,
        valueFontSize: valueFontSize ?? this.valueFontSize,
      );
}
