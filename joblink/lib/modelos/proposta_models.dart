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
}
