class Usuario {
  final String id;
  final String name;
  final String email;
  final String password;
  final String phone;
  final String tipoUsuario;
  final String dataPublicacao;
  final String especialidade;
  final String localizacao;
  final String dataCadastro;

  Usuario(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.phone,
      required this.tipoUsuario,
      required this.dataPublicacao,
      required this.especialidade,
      required this.dataCadastro,
      required this.localizacao});

      Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'tipoUsuario': tipoUsuario,
      'dataPublicacao': dataPublicacao,
      'especialidade': especialidade,
      'dataCadastro': dataCadastro,
      'localizacao': localizacao,
    };
  }
  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      phone: map['phone'],
      tipoUsuario: map['tipoUsuario'],    
      dataPublicacao: map['dataPublicacao'],
      especialidade: map['especialidade'],
      dataCadastro: map['dataCadastro'],
      localizacao: map['localizacao'],
    ); 
      
  }
}
