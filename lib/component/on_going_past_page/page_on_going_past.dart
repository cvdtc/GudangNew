import 'package:flutter/material.dart';

void main(){
  runApp(OnGoingPast());
}

class OnGoingPast extends StatefulWidget {
  @override
  _OnGoingPastState createState() => _OnGoingPastState();
}

class _OnGoingPastState extends State<OnGoingPast> with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 2); //LENGTH = TOTAL TAB YANG AKAN DIBUAT
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Order Status"),
          backgroundColor: Colors.white,
          bottom: TabBar(
            controller: controller,
            tabs: <Widget>[
              Text("Sedang Berjalan"),
              Text("Pesanan Expired")
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: <Widget>[
            berjalan(),
            expired()
          ],
        ),
      ),
    );
  }
}
