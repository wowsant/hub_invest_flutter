class SignupRequest {
  final String nome;
  final String email;
  final String senha;
  final String pais;
  final String telefone;

  SignupRequest({
    required this.nome,
    required this.email,
    required this.senha,
    required this.pais,
    required this.telefone,
  });

  Map<String, dynamic> toJson() => {
        "name": nome,
        "email": email,
        "password": senha,
        "country": pais,
        "phone": telefone,
      };
}
