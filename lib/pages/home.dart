import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sefaz_exemplo/bloc/BlocCertidaoNegativa.dart';
import 'package:sefaz_exemplo/components/drawer/drawer.dart';
import 'package:sefaz_exemplo/pages/certidao_negativa.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Bem Vindo",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        drawer: CustomDrawer(),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.blue.withOpacity(1.0),
                      child: InkWell(
                        onTap: () {openCertidao();}, // needed
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              Text("Certidao Negativa", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.blue.withOpacity(1.0),
                      child: InkWell(
                        onTap: () {openCertidao();}, // needed
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              Text("Certidao Negativa", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.blue.withOpacity(1.0),
                      child: InkWell(
                        onTap: () {openCertidao();}, // needed
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              Text("Certidao Negativa", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.blue.withOpacity(1.0),
                      child: InkWell(
                        onTap: () {openCertidao();}, // needed
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              Text("Certidao Negativa", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
        );
  }


  void openCertidao(){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider<BlocCertidaoNegativa>(
              builder: (_) => BlocCertidaoNegativa(),
              child: CertidaoPage(),
            )));
  }
}
