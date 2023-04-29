class Cliente {
  late int id;
  final String nome;
  final String email;
  final String endereco;

  static List<Cliente> Lista = [];
 
  Cliente({required this.nome, required this.email, required this.endereco});
  Cliente.withId({required this.id, required this.nome, required this.email, required this.endereco});
}