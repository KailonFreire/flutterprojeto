class Venda {
  late int id;
  final int idProduto;
  final int idCliente;
  final int quantidade;

  static List<Venda> Lista = [];

  Venda({required this.idProduto, required this.idCliente, required this.quantidade});
  Venda.withId({required this.id, required this.idProduto, required this.idCliente, required this.quantidade});
}