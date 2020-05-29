import 'package:GUDANGPROJECT/component/text_field_container_login.dart';
import 'package:GUDANGPROJECT/constant/constant_color.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key, this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(Icons.lock,
            color: Colors.white,
          ),
          suffixIcon: Icon(
            Icons. visibility,
            color: primaryColor,
          ),
          border: InputBorder.none,
        ),
      ),);
  }
}