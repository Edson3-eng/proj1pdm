class Proposta {
  final String id;
  final String valor;
  final String descricao;
  final String dataProposta;
  final String status;
  final String cidadaoId;
  final String freeLancerId;

  Proposta({
    required this.id,
    required this.valor,
    required this.cidadaoId,
    required this.freeLancerId,
    required this.descricao,
    required this.dataProposta,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'valor': valor,
      'descricao': descricao,
      'cidadaoId': cidadaoId,
      'freeLancerId': freeLancerId,
      'dataProposta': dataProposta,
      'status': status,
    };
  }
  static Proposta fromMap(Map<String, dynamic> map) {
    return Proposta(
      id: map['id'],
      valor: map['valor'],
      descricao: map['descricao'],
      cidadaoId: map['cidadaoId'],
      freeLancerId: map['freeLancerId'],
      dataProposta: map['dataProposta'],
      status: map['status'],
    );
  }
}
