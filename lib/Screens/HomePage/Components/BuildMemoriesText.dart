import 'package:audioplayer/Screens/TextScreen/TextScreen.dart';
import 'package:audioplayer/appSetting/ScreenDimension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Heart.dart';
import 'alert.dart';

class BuildMemoriesText extends StatefulWidget {
  final msg;

  BuildMemoriesText({this.msg});

  @override
  _BuildMemoriesTextState createState() => _BuildMemoriesTextState();
}

class _BuildMemoriesTextState extends State<BuildMemoriesText> {
  var x = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        GridView.builder(
            itemCount: widget.msg.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: SD().PropHeight(220),
            ),
            itemBuilder: (_, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return TextScreen(
                        text: widget.msg[index],
                      );
                    }));
                  },
                  child: CardDesign(index));
            }),
        x == true ? alert() : Container(),
      ],
    ));
  }

  CardDesign(int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SD().PropWidth(20)),
        color: Colors.red.shade700,
        boxShadow: [BoxShadow(color: Colors.black, blurRadius: 4)],
        border: Border.all(),
      ),
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(2),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                      widget.msg[index]["image"],
                    ),
                    fit: BoxFit.contain),
                border: Border.all(
                    color: Colors.black, width: 1, style: BorderStyle.solid),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            widget.msg[index]["history"],
            style: TextStyle(fontSize: SD().PropWidth(18), color: Colors.white),
          ),
        ],
      ),
    );
  }

  alert() {
    return SingleChildScrollView(
      child: Container(
        height: SD.screenHeight,
        color: Color(0xfa7d2e2e),
        child: AlertDialog(
          contentPadding: EdgeInsets.all(0),
          //backgroundColor: Colors.blueGrey,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50))),

          content: Container(
            height: SD().PropHeight(400),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xffc17073),
                Color(0xff9e6161),
                Color(0xff7b3345),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
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
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white54),
                  ),
                  onPressed: () {
                    setState(() {
                      print("*****");
                      x = false;
                    });
                  },
                  height: SD().PropHeight(40),
                  color: Color(0xd0e8a7a7),
                  child: Text(
                    "❤❤❤❤",
                    style: TextStyle(fontSize: SD().PropWidth(20)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
* Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                  image: DecorationImage(image: NetworkImage(msg[index]["image"],),fit: BoxFit.fill),
                  border:
                    Border.all(color: Colors.black, width: 1, style: BorderStyle.solid),
              ),

            ),
* */
