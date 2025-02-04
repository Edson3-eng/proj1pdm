class Avaliacao {
  final String id;
  final String cidadaoId;
  final String freeLancer;
  final String trabalhoId;
  final String nota;
  final String comentario;
  final String dataAvaliacao;

  Avaliacao(
      {required this.id,
      required this.nota,
      required this.comentario,
      required this.cidadaoId,
      required this.freeLancer,
      required this.trabalhoId,
      required this.dataAvaliacao});

      Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cidadaoId': cidadaoId,
      'freeLancer': freeLancer,
      'trabalhoId': trabalhoId,
      'nota': nota,
      'comentario': comentario,
      'dataAvaliacao': dataAvaliacao,
    };
  }
}
