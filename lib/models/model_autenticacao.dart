class Autenticacao {
  String username;
  Credentials credentials;
  Details details;

  Autenticacao({this.username, this.credentials, this.details});

  Autenticacao.fromJson(Map<String, dynamic> json) {
    username = json['Username'];
    credentials = json['Credentials'] != null
        ? new Credentials.fromJson(json['Credentials'])
        : null;
    details =
    json['Details'] != null ? new Details.fromJson(json['Details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Username'] = this.username;
    if (this.credentials != null) {
      data['Credentials'] = this.credentials.toJson();
    }
    if (this.details != null) {
      data['Details'] = this.details.toJson();
    }
    return data;
  }
}

class Credentials {
  String password;

  Credentials({this.password});

  Credentials.fromJson(Map<String, dynamic> json) {
    password = json['Password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Password'] = this.password;
    return data;
  }
}

class Details {
  String resourceApp;
  String usuarioHistorico;

  Details({this.resourceApp, this.usuarioHistorico});

  Details.fromJson(Map<String, dynamic> json) {
    resourceApp = json['ResourceApp'];
    usuarioHistorico = json['UsuarioHistorico'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResourceApp'] = this.resourceApp;
    data['UsuarioHistorico'] = this.usuarioHistorico;
    return data;
  }
}

