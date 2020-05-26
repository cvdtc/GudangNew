import 'package:GUDANGPROJECT/home_page.dart';
import 'package:flutter/material.dart';
// import 'login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // final routes = <String, WidgetBuilder>{
  //   LoginPage.tag: (context) => LoginPage(),
  //   HomePage.tag: (context) => HomePage(),
  // };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gudang',
      debugShowCheckedModeBanner: false,
      home: HomePage()
      // theme: ThemeData(      
      //   primarySwatch: Colors.blue,
      //   //fontFamily: 
      // ),
     
      // routes: routes,
      );
  }
}