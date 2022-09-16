import 'dart:io';

import 'cadastrar_empresa.dart';
import 'classes/empresa.dart';

List<Empresa> empresas = [];
void main() {
  int opcao;
  do {
    print(
        '''
  Bem-vindo(a) ao nosso sistema de empresas.
  Escolha o número da opção desejada:
  1 - Para cadastrar uma nova empresa.
  2 - Para buscar uma empresa cadastrada por CNPJ.
  3 - Para buscar uma empresa por CPF/CNPJ do Sócio.
  4 - Para listar as empresas cadastradas em ordem alfabética (baseado na Razão Social).
  5 - Para excluir uma empresa (por ID).
  6 - Para sair.
''');
    opcao = int.parse(stdin.readLineSync()!);
    switch (opcao) {
      case 1:
        adicionarNovaEmpresa();
        break;
      case 2:
        print('Digite o CNPJ que você deseja buscar: (somente números)');
        int cnpj = int.parse(stdin.readLineSync()!);
        buscarCNPJEmpresa(cnpj.toString());
        break;
      case 3:
        int busca;
        do {
          print(
              '''
            Você selecionou a opção buscar uma empresa por CPF/CNPJ do Sócio.
            Escolha a natureza jurídica do sócio:
            1 - Pessoa Física.
            2 - Pessoa Jurídica.
            ''');
          busca = int.parse(stdin.readLineSync()!);
        } while (busca != 1 && busca != 2);
        if (busca == 1) {
          print(
              'Digite o CPF do sócio que você deseja buscar (somente números):');
          int cpf = int.parse(stdin.readLineSync()!);
          buscarCPFSocio(cpf.toString());
        } else {
          print(
              'Digite o CNPJ do sócio que você deseja buscar (somente números):');
          int cnpj = int.parse(stdin.readLineSync()!);
          buscarCNPJSocio(cnpj.toString());
        }
        break;
      case 4:
        ordernarEmpresas();
        break;
      case 5:
        print('Digite o ID da empresa que você deseja remover:');
        String id = stdin.readLineSync()!;
        excluirEmpresaID(id);
        break;
      case 6:
        break;
      default:
        print('Opção inválida');
    }
  } while (opcao != 6);
}

void adicionarNovaEmpresa() {
  Empresa novaEmpresa = cadastrarEmpresa();
  empresas.add(novaEmpresa);
}

void buscarCNPJEmpresa(String cnpj) {
  final resultado = empresas.where((empresa) => empresa.cnpj == cnpj);
  resultado.isNotEmpty ? print(resultado) : print('CNPJ não encontrado');
}

void buscarCNPJSocio(String cnpj) {
  final resultado = empresas.where((empresa) => empresa.socio.registro == cnpj);
  resultado.isNotEmpty ? print(resultado) : print('CNPJ não encontrado');
}

void buscarCPFSocio(String cpf) {
  final resultado = empresas.where((empresa) => empresa.socio.registro == cpf);
  resultado.isNotEmpty ? print(resultado) : print('CNPJ não encontrado');
}

void ordernarEmpresas() {
  if (empresas.isNotEmpty) {
    empresas.sort(((a, b) => a.razaoSocial.compareTo(b.razaoSocial)));
    print(empresas);
  } else {
    print('Não há empresas cadastradas no momento');
  }
}

void excluirEmpresaID(String id) {
  final idValido = empresas.where((empresa) => empresa.id == id);
  if (idValido.isNotEmpty) {
    empresas.removeWhere((empresa) => empresa.id == id);
    print('Empresa removida com sucesso!');
  } else {
    print('Não existe nenhuma empresa registrada com esse ID');
  }
}
