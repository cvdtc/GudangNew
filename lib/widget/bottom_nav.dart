
import 'package:GUDANGPROJECT/constant/constant_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Bottom_nav extends StatefulWidget {
  @override
  _Bottom_navState createState() => 
  _Bottom_navState();
}

class _Bottom_navState extends State<Bottom_nav> {
  int _selectedIndex = 0;
  
  var bottomTextStyle =
      GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500);

void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: mFillColor,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 15,
              offset: Offset(0, 5))
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? new SvgPicture.asset('assets/icon/home_colored.svg')
                : new SvgPicture.asset('assets/icon/home.svg'),
            title: Text(
              'Home',
              style: bottomTextStyle,
            ),
          ),

          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? new SvgPicture.asset('assets/icon/order_colored.svg')
                : new SvgPicture.asset('assets/icon/order.svg'),
            title: Text(
              'My Order',
              style: bottomTextStyle,
            ),
          ),

          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? new SvgPicture.asset('assets/icon/watch_colored.svg')
                : new SvgPicture.asset('assets/icon/watch.svg'),
            title: Text(
              'Watch List',
              style: bottomTextStyle,
            ),
          ),

          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? new SvgPicture.asset('assets/icon/account_colored.svg')
                : new SvgPicture.asset('assets/icon/account.svg'),
            title: Text(
              'Account',
              style: bottomTextStyle,
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: mBlueColor,
        unselectedItemColor: mSubtitleColor,
        onTap: _onItemTapped,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        showUnselectedLabels: true,
        elevation: 0,
      ),
    );
  }
}