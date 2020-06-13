import 'package:GUDANGPROJECT/component/already_have_account.dart';
import 'package:GUDANGPROJECT/component/background_login_page.dart';
import 'package:GUDANGPROJECT/component/rounded_button.dart';
import 'package:GUDANGPROJECT/component/rounded_input_field.dart';
import 'package:GUDANGPROJECT/component/rounded_password_field.dart';
import 'package:GUDANGPROJECT/component/text_field_container_login.dart';
import 'package:GUDANGPROJECT/constant/constant_color.dart';
import 'package:GUDANGPROJECT/screen/home_page.dart';
import 'package:GUDANGPROJECT/screen/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
            "assets/svg/drawing_login.svg",
            height: size.height * 0.35,
          ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedInputFile(
              HintText: "Masukkan Email Anda",
              onChanged: (value){},
            ),
            RoundedPasswordField(
              onChanged: (value){},
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedButton(
              text: "LOGIN",
              press: (){
                Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context){
                    return HomePage();
                  },
                ),
                );
              },
            ),
            AlreadyHaveAccountCheck(
              press: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context){
                        return RegisterPage();
                      },
                    ),
                );
              },
            ),
        ],
    ),
      ),
  );
  }
}








