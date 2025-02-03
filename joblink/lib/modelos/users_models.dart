class Usuario {
  final String id;
  final String name;
  final String email;
  final String password;
  final String phone;
  final String image;
  final String tipoUsuario;
  final String dataPublicacao;
  final String especialidade;
  final String localizacao;

  Usuario(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.phone,
      required this.image,
      required this.tipoUsuario,
      required this.dataPublicacao,
      required this.especialidade,
      required this.localizacao});
}
