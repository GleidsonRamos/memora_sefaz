enum TipoAmbiente { HOMOLOG, PRODUCAO, DESENV}

class UrlStore {

  static TipoAmbiente tipoAmbiente = TipoAmbiente.DESENV;

  //Urls producao
  static String _url_autenticacao_producao = 'URL PARA LOGIN EM PRODUCAO';

  //Urls homolog
  static String _url_autenticacao_homolog = 'URL PARA LOGIN EM HOMOLOGACAO';

  //Urls desenv
  static String _url_autenticacao_desenv = 'URL PARA LOGIN EM DESENVOLVIMENTO';


  static String getUrlLogin() {
    if (tipoAmbiente == TipoAmbiente.HOMOLOG) {
      return _url_autenticacao_homolog;
    }
    else if(tipoAmbiente == TipoAmbiente.DESENV){
      return _url_autenticacao_desenv;
    }
    return _url_autenticacao_producao;
  }

}
