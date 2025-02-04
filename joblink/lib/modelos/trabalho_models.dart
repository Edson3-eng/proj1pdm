class Trabalho {
  final int id;
  final String titulo;
  final String cidadaoId;
  final String descricao;
  final String categoria;
  final String orcamento;
  final String dataCriacao;
  final String dataLimite;
  final String propostas;
  final String prazo;
  final String status;
  final String localizacao;

  Trabalho(
      {required this.id,
      required this.cidadaoId,
      required this.localizacao,
      required this.prazo,
      required this.status,
      required this.titulo,
      required this.descricao,
      required this.categoria,
      required this.orcamento,
      required this.dataCriacao,
      required this.dataLimite,
      required this.propostas});

    Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'localizacao': localizacao,
      'categoria': categoria,
      'orcamento': orcamento,
      'dataCriacao': dataCriacao,
      'dataLimite': dataLimite,
      'propostas': propostas,
      'prazo': prazo,
      'status': status,
      'cidadaoId': cidadaoId,
    };
  }
}
