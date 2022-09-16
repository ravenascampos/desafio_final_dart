class Endereco {
  String logradouro;
  String numero;
  String? complemento;
  String bairro;
  String cidade;
  String estado;
  String cep;
  Endereco(
      {required this.logradouro,
      required this.numero,
      this.complemento,
      required this.bairro,
      required this.cidade,
      required this.estado,
      required this.cep});

  @override
  String toString() {
    return '''$logradouro, $numero, $bairro, $cidade/$estado, CEP: $cep''';
  }
}
