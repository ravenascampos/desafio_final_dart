import 'endereco.dart';
import '../pessoa.dart';

class PessoaJuridica implements Pessoa {
  String razaoSocial;
  String nomeFantasia;
  String cnpj;
  Endereco endereco;
  PessoaJuridica(
      {required this.razaoSocial,
      required this.nomeFantasia,
      required this.cnpj,
      required this.endereco});

  String mascaraCNPJ(String cnpj) {
    return "${cnpj.substring(0, 2)}.${cnpj.substring(2, 5)}.${cnpj.substring(5, 8)}/${cnpj.substring(8, 12)}-${cnpj.substring(12)}";
  }

  @override
  String toString() {
    return '''
  CNPJ: ${mascaraCNPJ(cnpj)}
  Razão Social: $razaoSocial
  Nome Fantasia: $nomeFantasia
  Endereço: $endereco
''';
  }

  @override
  String get registro => cnpj;
}
