import 'package:audioplayer/appSetting/ScreenDimension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'Components/BuildMemoriesText.dart';
import 'Components/Heart.dart';

class HomePage extends StatelessWidget {
  static String id = "HomePage";
  var db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    SD().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Raneem You Are My All And Only"),
        centerTitle: true,
        backgroundColor: Colors.red.shade700,
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xffd5868b),
                Color(0xffbb7c7c),
                Color(0xff934658),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
          ),
          FutureBuilder(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              Widget widgets = Container();
              print(snapshot.data.runtimeType);
              if (snapshot.hasData) {
                var msgs = (snapshot.data as List);

                widgets = BuildMemoriesText(
                  msg: msgs,
                );
                return widgets;
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
          // HeartWidget(),
        ],
      )),
    );
  }

  getData() async {
    var data = [];
    await db.collection("msg").get().then((value) {
      value.docs.forEach((element) {
        data.add(element.data());
      });
    });
    return data;
  }
}
