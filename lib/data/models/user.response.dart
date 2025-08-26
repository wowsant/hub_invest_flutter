class UserResponse {
  final String usuarioId;

  UserResponse({required this.usuarioId});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(usuarioId: json['usuarioId']);
  }
}
