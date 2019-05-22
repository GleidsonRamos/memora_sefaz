import 'package:flutter/material.dart';
import 'package:sefaz_exemplo/bloc/BlocLogin.dart';
import 'package:provider/provider.dart';
import 'package:sefaz_exemplo/pages/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //Abaixo a implementaçao do plugin provider para utilizacao da arquitetura bloc no gerenciamento de estado da aplicaçao
      home: ChangeNotifierProvider<BlocLogin>(
        builder: (_) => BlocLogin(),
        child: LoginPage(),
      ),
    );
  }
}