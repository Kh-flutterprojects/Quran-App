import 'dart:io';

import 'package:audioplayer/appSetting/ScreenDimension.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../buildAudioCard.dart';

class TextScreen extends StatefulWidget {
  final text;

  TextScreen({this.text});

  @override
  _TextScreenState createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  var data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = [
      "https://firebasestorage.googleapis.com/v0/b/notes-dca0f.appspot.com/o/1.mp3?alt=media&token=397e67da-e2d9-4276-b968-b8c80b009f81",
      "https://firebasestorage.googleapis.com/v0/b/notes-dca0f.appspot.com/o/2.mp3?alt=media&token=30deee10-b110-4ca8-bf7b-71ff7be0fee1",
      "https://firebasestorage.googleapis.com/v0/b/notes-dca0f.appspot.com/o/3.mp3?alt=media&token=67dc6218-c642-4452-a6d6-7032d16311b9",
      "https://firebasestorage.googleapis.com/v0/b/notes-dca0f.appspot.com/o/4.mp3?alt=media&token=9cdd3dc4-18cd-4db9-8915-6c6639cbcb75"
    ];
  }

  @override
  Widget build(BuildContext context) {
    var x= widget.text["text"].toString();
    print(widget.text["text"].toString().contains("non"));
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(186, 80, 80, 1.0),
        //Color.fromRGBO(57, 115, 137, 1.0),
        body: SafeArea(
          child: !widget.text["text"].toString().contains("non")
              ? Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xffc17073),
                      Color(0xff9e6161),
                      Color(0xff7b3345),
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  ),
                  width: SD().PropWidth(SD.screenWidth),
                  child: Column(
                    children: [
                      quotContaier(),
                      SizedBox(
                        height: SD().PropHeight(5),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black26,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Color.fromRGBO(30, 35, 35, 1.0),
                                        width: 2)),
                                padding: EdgeInsets.all(8),
                                child: Text(widget.text["text"],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16))),
                          ),
                        ),
                      ),
                      AudioCard(widget.text["audio"], true),
                    ],
                  ),
                )
              : Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xffc17073),
                      Color(0xff9e6161),
                      Color(0xff7b3345),
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  ),
                  width: SD().PropWidth(SD.screenWidth),
                  child: Column(
                    children: [
                      quotContaier(),
                      SizedBox(
                        height: SD().PropHeight(5),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black26,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Color.fromRGBO(
                                            135, 16, 33, 1.0),
                                        width: 1)),
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    AudioCard(data[0], true),
                                    SizedBox(height: 5,),
                                    AudioCard(data[1], true),
                                    AudioCard(data[2], true),
                                    AudioCard(data[3], true),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget quotContaier() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: SD().PropHeight(100),
        width: SD.screenWidth,
        decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black45, width: 2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultTextStyle(
              style: TextStyle(fontSize: 20, color: Colors.white),
              child: Column(
                children: [
                  Text(widget.text["quot1"] + "       "),
                  Text("       " + widget.text["quot2"]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  getData() async {
    var data = [];
    sleep(Duration(seconds: 3));
    data = await widget.text["audios"];
    return data;
  }
}
