import 'dart:io';

import '../classes/endereco.dart';
import 'mascaras.dart';

Endereco cadastrarEndereco() {
  print('Informe o logradouro:');
  String logradouro = stdin.readLineSync()!;
  print('Informe o número:');
  String numero = stdin.readLineSync()!;
  print('Informe o complemento (campo não obrigatório):');
  String complemento = stdin.readLineSync()!;
  print('Informe o bairro:');
  String bairro = stdin.readLineSync()!;
  print('Informe a cidade:');
  String cidade = stdin.readLineSync()!;
  print('Informe o estado:');
  String estado = stdin.readLineSync()!;
  print('Informe o CEP (somente números):');
  int cep = int.parse(stdin.readLineSync()!);
  return Endereco(
      logradouro: logradouro,
      numero: numero,
      complemento: complemento,
      bairro: bairro,
      cidade: cidade,
      estado: estado,
      cep: mascaraCEP(cep.toString()));
}
