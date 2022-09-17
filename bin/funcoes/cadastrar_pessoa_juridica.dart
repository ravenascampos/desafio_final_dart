import 'dart:io';

import '../classes/endereco.dart';
import '../classes/pessoa_juridica.dart';
import 'cadastrar_endereco.dart';
import 'validacoes.dart';

PessoaJuridica cadastrarPessoaJuridica() {
  print('Informe a Razão Social:');
  String razaoSocial = stdin.readLineSync()!;
  print('Informe o Nome Fantasia:');
  String nomeFantasia = stdin.readLineSync()!;
  print('Informe o CNPJ (somente números):');
  int cnpj = int.parse(stdin.readLineSync()!);
  validarCNPJ(cnpj.toString());
  Endereco endereco = cadastrarEndereco();
  return PessoaJuridica(
      razaoSocial: razaoSocial,
      nomeFantasia: nomeFantasia,
      cnpj: cnpj.toString(),
      endereco: endereco);
}
