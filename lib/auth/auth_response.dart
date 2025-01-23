

class AuthResponse {
  final String accessToken;
  final bool isAdmin;
  final bool isUser;

  const AuthResponse({
    required this.accessToken,
    required this.isAdmin,
    required this.isUser,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'accessToken': String accessToken,
        'isAdmin': bool isAdmin,
        'isUser': bool isUser,
      } =>
        AuthResponse(
          accessToken: accessToken,
          isAdmin: isAdmin,
          isUser: isUser,
        ),
      _ => throw const FormatException('Failed to load AuthResponse.'),
    };
  }
}