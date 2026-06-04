class AuthSession {
  const AuthSession({
    required this.token,
    this.userInfo,
  });

  final String token;
  final Map<String, dynamic>? userInfo;
}
