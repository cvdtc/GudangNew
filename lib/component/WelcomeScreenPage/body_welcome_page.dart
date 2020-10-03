import 'dart:async';

import 'package:GUDANGPROJECT/api/utils/apiService.dart';
import 'package:GUDANGPROJECT/component/LoginPage/Login.Validation.dart';
import 'package:GUDANGPROJECT/component/WelcomeScreenPage/background_welcome_page.dart';
import 'package:GUDANGPROJECT/widget/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class  BodyWelcomePage extends StatefulWidget {
  @override
  _BodyWelcomePageState createState() => _BodyWelcomePageState();
}

class _BodyWelcomePageState extends State<BodyWelcomePage> {
  bool _showbutton = false;
  cekToken() async {
    bool _isLoading = false;
    ApiService _apiService = ApiService();
    bool isSuccess = true;
    // sp = await SharedPreferences.getInstance();
    var token = "", newtoken = "", access_token = "", refresh_token = "";
    SharedPreferences sp = await SharedPreferences.getInstance();
    access_token = sp.getString("access_token");
    refresh_token = sp.getString("refresh_token");
    print("MASUK CEK TOKEN $access_token");
    //checking jika token kosong maka di arahkan ke menu login jika tidak akan meng-hold token dan refresh token
    if (access_token == null) {
      print("access token null");
      showAlertDialog(context);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
              (Route<dynamic> route) => true);
    } else {
      print("1");
      _apiService.checkingToken(access_token).then((value) => setState(() {
        print("2");
        isSuccess = value;
        //checking jika token expired/tidak berlaku maka akan di ambilkan dari refresh token
        if (!isSuccess) {
          print("3");
          _apiService
              .refreshToken(refresh_token)
              .then((value) => setState(() {
            var newtoken = value;
            //setting access_token dari refresh_token
            print("4");
            if (newtoken != "") {
              sp.setString("access_token", newtoken);
              access_token = newtoken;
              print("harusnya masuk dsbord");
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => Home()),
                      (Route<dynamic> route) => true);
            } else {
              showAlertDialog(context);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          LoginPage()),
                      (Route<dynamic> route) => true);
            }
          }));
        }
      }));
    }
  }

  @override
  void initState() {
    super.initState();
    cekToken();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/svg/drawing_login1.svg",
              alignment: Alignment.center,
              fit: BoxFit.contain,
            ),
            // SizedBox(height: size.height * 0.03),
            SpinKitCircle(
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {},
    );

    AlertDialog alert = AlertDialog(
      title: Text("----------"),
      content: Text("Welcome Page example"),
      actions: [
        okButton,
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
