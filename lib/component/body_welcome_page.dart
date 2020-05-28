import 'package:GUDANGPROJECT/component/background.dart';
import 'package:GUDANGPROJECT/component/rounded_button.dart';
import 'package:GUDANGPROJECT/constant/constant_color.dart';
import 'package:GUDANGPROJECT/screen/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text(
            "Selamat Datang di HORANG Apps",
        style: TextStyle(fontWeight: FontWeight.bold),
        ),
          SizedBox(height: size.height * 0.03),
          SvgPicture.asset(
            "assets/svg/drawing_login.svg",
            height: size.height * 0.4,
          ),
          SizedBox(height: size.height * 0.03),
          RoundedButton(
            text: "LOGIN",
            press: (){
              Navigator.push(
                context, MaterialPageRoute(
                builder: (context){
                  return LoginPage();
                  },
                ),
              );
              },
          ),
          RoundedButton(
            text: "REGISTRASI",
            color: primaryDarkColor,
            textColor: Colors.black,
            press: (){},
          ),
        ],
    ),
      ),);
  }
}




