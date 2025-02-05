class Mensagem {
  final String id;
  final String conteudo;
  final String dataEnvio;
  final String lida;
  final String cidadaoId;
  final String freeLancerId;

  Mensagem(
      {required this.id,
      required this.cidadaoId,
      required this.freeLancerId,
      required this.conteudo,
      required this.dataEnvio,
      required this.lida});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'conteudo': conteudo,
      'dataEnvio': dataEnvio,
      'cidadaoId': cidadaoId,
      'freeLancerId': freeLancerId,
      'lida': lida,
    };
  }
  static Mensagem fromMap(Map<String, dynamic> map) {
    return Mensagem(
      id: map['id'],
      conteudo: map['conteudo'],
      dataEnvio: map['dataEnvio'],
      cidadaoId: map['cidadaoId'],
      freeLancerId: map['freeLancerId'],
      lida: map['lida'],
    );
  }
}
