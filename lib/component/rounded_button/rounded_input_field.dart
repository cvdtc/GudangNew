import 'package:GUDANGPROJECT/component/text_field_container_login.dart';
import 'package:GUDANGPROJECT/constant/constant_color.dart';
import 'package:flutter/material.dart';
class RoundedInputFile extends StatelessWidget {
  final String HintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputFile({
    Key key,
    this.HintText,
    this.icon = Icons.email,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.white,),
          hintText: HintText,
          border: InputBorder.none,
        ),

      ),
    );
  }
}