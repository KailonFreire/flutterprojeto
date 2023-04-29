class Produto {
  late int id;
  final String nome;
  final double preco;

  static List<Produto> Lista = [];

  Produto({required this.nome, required this.preco});
  Produto.withId({required this.id, required this.nome, required this.preco});
}