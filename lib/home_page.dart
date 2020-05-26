import 'package:GUDANGPROJECT/constant/constant_color.dart';
import 'package:GUDANGPROJECT/widget/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mBackgroudnColor,
        title: SvgPicture.asset('assets/svg/ihp_logo.svg'),
      ),

      backgroundColor: mBackgroudnColor,
      bottomNavigationBar: Bottom_nav(),
    );
  }
}