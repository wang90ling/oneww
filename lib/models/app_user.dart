class AppUser {
  final String name;
  final String title;
  final String avatarUrl;

  const AppUser({
    required this.name,
    required this.title,
    this.avatarUrl = '',
  });
}
