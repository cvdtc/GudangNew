import 'package:flutter/material.dart';

import 'constant/constant_color.dart';

class RegisterPage extends StatelessWidget {

  static const routeName = "/register_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryColor,
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  _iconRegister(),
                  _tittleDescription(),
                  _textField(),
                  _buildButton(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _iconRegister(){
    return Image.asset(
      'assets/register.jpg',
      width: 150.0,
      height: 150.0,
    );
  }

  Widget _tittleDescription(){
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top:16.0),
          ),
          Text(
            "Registration",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top:12.0),
            ),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
      ],
    );
  }
  Widget _textField(){
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top:12.0),
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: underlineTextField,
                  width: 1.5,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 3.0,
                ),
              ),
              hintText: "Username",
              hintStyle: TextStyle(color: hintColor),
            ),
            style: TextStyle(color: Colors.white),
            autofocus: false,
          ),
          Padding(padding: EdgeInsets.only(top:12),
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: underlineTextField,
                  width: 1.5,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 3.0,
                ),
              ),
              hintText: "Password",
              hintStyle: TextStyle(color: hintColor),
            ),
            style: TextStyle(color: Colors.white),
            obscureText: true,
            autofocus: false,
          ),
          Padding(padding: EdgeInsets.only(top: 12.0),
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: underlineTextField,
                  width: 1.5,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 3.0
                ),
              ),
              hintText: "Confirm Password",
              hintStyle: TextStyle(color: hintColor),
            ),
            style: TextStyle(color: Colors.white),
            obscureText: true,
            autofocus: false,
          ),
      ],
    );
  }
  Widget _buildButton(BuildContext context){
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 16.0),
        ),
        InkWell(
          child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          width: double.infinity,
          child: Text(
            'Register',
            style: TextStyle(color: primaryColor),
            textAlign: TextAlign.center,
          ),  
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
          Padding(padding: EdgeInsets.only(top: 16.0),
          ),
          Text(
            'Or',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
          FlatButton(
            child: Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: (){
              Navigator.pushNamed(context, "/");
            },
          ),
      ],
    );
  }
}