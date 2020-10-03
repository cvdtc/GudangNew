import 'package:GUDANGPROJECT/screen/welcome_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gudang',
      theme: ThemeData(
//        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      debugShowCheckedModeBanner: false,
        home: WelcomePage(),
      );
  }
}
