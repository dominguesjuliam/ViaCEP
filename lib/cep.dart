class Cep {
  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String localidade;
  String uf;

  Cep({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
  });

  static List<Cep> cepList = [];

  static void addCep(Cep cep) {
    cepList.add(cep);
  }
}
