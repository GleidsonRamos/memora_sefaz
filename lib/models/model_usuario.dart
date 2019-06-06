class Usuario {
  PessoaFisica pessoaFisica;
  String foto;

  Usuario({this.pessoaFisica, this.foto});

  Usuario.fromJson(Map<String, dynamic> json) {
    pessoaFisica = json['PessoaFisica'] != null
        ? new PessoaFisica.fromJson(json['PessoaFisica'])
        : null;
    foto = json['Foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pessoaFisica != null) {
      data['PessoaFisica'] = this.pessoaFisica.toJson();
    }
    data['Foto'] = this.foto;
    return data;
  }
}

class PessoaFisica {
  int idPessoa;
  String numeroCpf;
  int numeroPessoaBase;
  String nome;
  String dataNascimento;
  String sexo;

  PessoaFisica(
      {this.idPessoa,
        this.numeroCpf,
        this.numeroPessoaBase,
        this.nome,
        this.dataNascimento,
        this.sexo});

  PessoaFisica.fromJson(Map<String, dynamic> json) {
    idPessoa = json['IdPessoa'];
    numeroCpf = json['NumeroCpf'];
    numeroPessoaBase = json['NumeroPessoaBase'];
    nome = json['Nome'];
    dataNascimento = json['DataNascimento'];
    sexo = json['Sexo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IdPessoa'] = this.idPessoa;
    data['NumeroCpf'] = this.numeroCpf;
    data['NumeroPessoaBase'] = this.numeroPessoaBase;
    data['Nome'] = this.nome;
    data['DataNascimento'] = this.dataNascimento;
    data['Sexo'] = this.sexo;
    return data;
  }
}
