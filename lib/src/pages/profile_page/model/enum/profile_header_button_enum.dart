enum ProfileHeaderButtonEnum {
  info(id: 1, title: 'مشخصات'),
  prescription(id: 2, title: 'نسخه');

  final int id;
  final String title;

  const ProfileHeaderButtonEnum({
    required this.id,
    required this.title,
  });
}
