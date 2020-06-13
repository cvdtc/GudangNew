import 'package:GUDANGPROJECT/constant/constant_color.dart';
import 'package:flutter/material.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({
    Key key,
    @required this.size, this.press,
  }) : super(key: key);

  final Size size;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
//      padding: EdgeInsets.all(20),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text ("Bayar Sekarang", style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

