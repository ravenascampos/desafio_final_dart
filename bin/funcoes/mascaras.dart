String mascaraCelular(String contato) {
  return "(${contato.substring(0, 2)}) ${contato.substring(2, 3)} ${contato.substring(3, 7)}-${contato.substring(7)}";
}

String mascaraTelefone(String contato) {
  return "(${contato.substring(0, 2)}) ${contato.substring(2, 6)}-${contato.substring(6)}";
}

String mascaraCEP(String cep) {
  return "${cep.substring(0, 2)}.${cep.substring(2, 5)}-${cep.substring(5)}";
}
