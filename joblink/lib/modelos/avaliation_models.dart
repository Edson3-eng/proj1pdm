class Avaliacao {
  final String id;
  final String cidadaoId;
  final String freeLancerId;
  final String trabalhoId;
  final String nota;
  final String comentario;
  final String dataAvaliacao;

  Avaliacao(
      {required this.id,
      required this.nota,
      required this.comentario,
      required this.cidadaoId,
      required this.freeLancerId,
      required this.trabalhoId,
      required this.dataAvaliacao});

      Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cidadaoId': cidadaoId,
      'freeLancer': freeLancerId,
      'trabalhoId': trabalhoId,
      'nota': nota,
      'comentario': comentario,
      'dataAvaliacao': dataAvaliacao,
    };
  }
  static Avaliacao fromMap(Map<String, dynamic> map) {
    return Avaliacao(
      id: map['id'],
      cidadaoId: map['cidadaoId'],
      freeLancerId: map['freeLancerId'],
      trabalhoId: map['trabalhoId'],
      nota: map['nota'],
      comentario: map['comentario'],
      dataAvaliacao: map['dataAvaliacao'],
    );
  }
}
