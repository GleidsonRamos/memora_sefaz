class ModelUser{

  String user;
  String pass;
  String someExtraData;

  ModelUser({
    this.user,
    this.pass,
    this.someExtraData
  });

  ModelUser.fromJson(Map<dynamic, dynamic> json) {
    user = json['user'];
    pass = json['pass'];
    someExtraData = json['someExtraData'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['pass'] = this.pass;
    data['someExtraData'] = this.someExtraData;
    return data;
  }

}