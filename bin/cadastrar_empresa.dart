import 'dart:io';

import 'package:uuid/uuid.dart';

import 'cadastrar_pessoa_fisica.dart';
import 'cadastrar_pessoa_juridica.dart';
import 'classes/empresa.dart';
import 'classes/endereco.dart';
import 'funcoes/cadastrar_endereco.dart';
import 'funcoes/mascaras.dart';
import 'funcoes/validacoes.dart';
import 'pessoa.dart';

Empresa cadastrarEmpresa() {
  print('Informe a Razão Social:');
  String razaoSocial = stdin.readLineSync()!;
  print('Informe o Nome Fantasia:');
  String nomeFantasia = stdin.readLineSync()!;
  int cnpj;
  do {
    print('Informe o CNPJ (somente números):');
    cnpj = int.parse(stdin.readLineSync()!);
    validarCNPJ(cnpj.toString());

    if (cnpj.runtimeType != int) {
      print("Informe apenas números");
    }
  } while (cnpj.runtimeType != int);
  int contatoNum;
  String contato;
  int escolha;
  do {
    print('''
      Escolha o tipo de contato que você deseja cadastrar:
      1 - Celular
      2 - Telefone Fixo
      ''');
    escolha = int.parse(stdin.readLineSync()!);
  } while (escolha != 1 && escolha != 2);
  if (escolha == 1) {
    print('Digite o número do celular com ddd, sem o zero (apenas números):');
    contatoNum = int.parse(stdin.readLineSync()!);
    contato = mascaraCelular(contatoNum.toString());
  } else {
    print('Digite o número do telefone com ddd, sem o zero (apenas números):');
    contatoNum = int.parse(stdin.readLineSync()!);
    contato = mascaraTelefone(contatoNum.toString());
  }
  Endereco endereco = cadastrarEndereco();
  Pessoa socio;
  int opcao;
  do {
    print('''
  Agora, precisamos das informações do sócio.
  Escolha o número da opção desejada:
  1 - Pessoa Física.
  2 - Pessoa Jurídica.
  ''');
    opcao = int.parse(stdin.readLineSync()!);
  } while (opcao != 1 && opcao != 2);
  if (opcao == 1) {
    socio = cadastrarPessoaFisica();
  } else {
    socio = cadastrarPessoaJuridica();
  }

  print('Cadastro realizado com sucesso!');
  return Empresa(
      id: Uuid().v4(),
      razaoSocial: razaoSocial,
      nomeFantasia: nomeFantasia,
      cnpj: cnpj.toString(),
      contato: contato.toString(),
      cadastro: DateTime.now(),
      endereco: endereco,
      socio: socio);
}
