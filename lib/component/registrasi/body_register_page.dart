import 'package:GUDANGPROJECT/component/already_have_account.dart';
import 'package:GUDANGPROJECT/component/background_register_page.dart';
import 'package:GUDANGPROJECT/component/rounded_button.dart';
import 'package:GUDANGPROJECT/component/rounded_input_field.dart';
import 'package:GUDANGPROJECT/component/rounded_password_field.dart';
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
          children: <Widget>[
            Text("Registrasi",
            style: TextStyle(
              fontWeight: FontWeight.bold),
            ),
//            SizedBox(height: size.height * 0.03),
//            SvgPicture.asset(
//                "assets/svg/drawing_register.svg",
//              height: size.height * 0.35,
//            ),
            RoundedInputFile(
              HintText: "Nama Lengkap",
              onChanged: (value){},
            ),
            RoundedInputFile(
              HintText: "Email Anda",
              onChanged: (value){},
            ),
            RoundedPasswordField(
              onChanged: (value){},
            ),
            RoundedButton(
              text:"Registrasi",
              press: (){},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAccountCheck(
              login: false,
              press: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context){
                          return LoginPage();
                        },
                    ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}