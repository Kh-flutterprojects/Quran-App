import 'dart:async';
import 'package:audioplayer/appSetting/ScreenDimension.dart';
import 'package:flutter/material.dart';

class SmSCode extends StatefulWidget {
  @override
  _SmSCodeState createState() => _SmSCodeState();
}

class _SmSCodeState extends State<SmSCode> {
  var code = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: SD.screenHeight/1.2,
        color: Color(0xfa7d2e2e),
        child: AlertDialog(
          contentPadding: EdgeInsets.all(0),
          //backgroundColor: Colors.blueGrey,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50))),

          content: Container(
            height: 320,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xffc17073),
                Color(0xff9e6161),
                Color(0xff7b3345),
              ],begin:Alignment.topLeft,end: Alignment.bottomRight ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: SD().PropHeight(20),
                ),
                Text("Raneem",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                SizedBox(
                  height: SD().PropHeight(20),
                ),
                Text("You Are My All",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                Text("You Are My Happiness",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                Text("You Are My Hope",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                Text("Love You",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                Text("So So..Much",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                SizedBox(
                  height: SD().PropHeight(80),
                ),
                MaterialButton(
                  onPressed: () {},
                  height: SD().PropHeight(40),
                  color: Color(0xd0e28686),
                  child: Text("❤❤❤❤"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
