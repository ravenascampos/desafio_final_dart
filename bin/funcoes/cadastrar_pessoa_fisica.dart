import 'dart:io';

import '../classes/endereco.dart';
import '../classes/pessoa_fisica.dart';
import 'cadastrar_endereco.dart';
import 'validacoes.dart';

PessoaFisica cadastrarPessoaFisica() {
  print('Informe o nome completo:');
  String nome = stdin.readLineSync()!;
  print('Informe o CPF (somente números):');
  int cpf = int.parse(stdin.readLineSync()!);
  validarCPF(cpf.toString());
  Endereco endereco = cadastrarEndereco();
  return PessoaFisica(nome: nome, cpf: cpf.toString(), endereco: endereco);
}
