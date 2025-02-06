enum ProfileHeaderButtonEnum {
  info(id: 1, title: 'مشخصات'),
  prescription(id: 2, title: 'نسخه'),
  treatmentCalendar(id: 3, title: 'تقویم درمانی'),
  reports(id: 4, title: 'گزارشات'),
  medicalRecords(id: 5, title: 'سوابق و اسناد درمانی');

  final int id;
  final String title;

  const ProfileHeaderButtonEnum({
    required this.id,
    required this.title,
  });
}
