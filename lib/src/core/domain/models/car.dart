


class Car {
  const Car({
    required this.id,
    required this.timestampCadastro,
    required this.modeloId,
    required this.ano,
    required this.combustivel,
    required this.numPortas,
    required this.cor,
    required this.nomeModelo,
    required this.valor,
  });

  factory Car.fromMap(Map<String, dynamic> map) {
    final timestampCadastro = map['timestamp_cadastro'] as int;
    return Car(
      id: map['id'] as int,
      timestampCadastro: DateTime
          .fromMillisecondsSinceEpoch(timestampCadastro),
      modeloId: map['modelo_id'] as int,
      ano: map['ano'] as int,
      combustivel: map['combustivel'] as String,
      numPortas: map['num_portas'] as int,
      cor: map['cor'] as String,
      nomeModelo: map['nome_modelo'] as String,
      valor: map['valor'] as double,
    );
  }


  final int id;
  final DateTime timestampCadastro;
  final int modeloId;
  final int ano;
  final String combustivel;
  final int numPortas;
  final String cor;
  final String nomeModelo;
  final double valor;

}