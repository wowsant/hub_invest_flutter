class SignupResponse {
  final String usuarioId;

  SignupResponse({required this.usuarioId});

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    return SignupResponse(usuarioId: json["usuarioId"]);
  }
}
