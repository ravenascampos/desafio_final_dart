import 'endereco.dart';
import 'pessoa.dart';

class Empresa {
  String id;
  String razaoSocial;
  String nomeFantasia;
  String cnpj;
  String contato;
  DateTime cadastro;
  Endereco endereco;
  Pessoa socio;
  Empresa(
      {required this.id,
      required this.razaoSocial,
      required this.nomeFantasia,
      required this.cnpj,
      required this.contato,
      required this.cadastro,
      required this.endereco,
      required this.socio});

  String mascaraCNPJ(String cnpj) {
    return "${cnpj.substring(0, 2)}.${cnpj.substring(2, 5)}.${cnpj.substring(5, 8)}/${cnpj.substring(8, 12)}-${cnpj.substring(12)}";
  }

  @override
  String toString() {
    return '''
  ID: $id
  CNPJ: ${mascaraCNPJ(cnpj)}
  Data de Cadastro: $cadastro
  Razão Social: $razaoSocial
  Nome Fantasia: $nomeFantasia
  Contato: $contato
  Endereço: $endereco
  SÓCIO:
    $socio
''';
  }
}
