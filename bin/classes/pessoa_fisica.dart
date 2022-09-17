import 'endereco.dart';
import 'pessoa.dart';

class PessoaFisica implements Pessoa {
  String nome;
  String cpf;
  Endereco endereco;
  PessoaFisica({required this.nome, required this.cpf, required this.endereco});

  String mascaraCPF(String cpf) {
    return "${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6, 9)}-${cpf.substring(9)}";
  }

  @override
  String toString() {
    return '''CPF: ${mascaraCPF(cpf)}
  Nome Completo: $nome
  Endereço: $endereco
''';
  }

  @override
  String get registro => cpf;
}
