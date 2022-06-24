import 'package:audioplayer/Providers/ReaderProvider.dart';
import 'package:audioplayer/Screens/SoraList/componenst/buildAudioCard.dart';
import 'package:audioplayer/Screens/SoraList/componenst/bulidListTile.dart';
import 'package:audioplayer/Screens/SoraList/componenst/dropDownmenue.dart';
import 'package:audioplayer/appSetting/ScreenDimension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SoraList extends StatelessWidget {
  const SoraList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xff140d2a),
        appBar: AppBar(
          backgroundColor: Color(0xff140d2a),
        ),
        body: Column(
          children: [
            SizedBox(
              height: SD().PropHeight(20),
            ),
            Selector<ReaderP, String>(
              selector: (cox, val) => val.reader[val.currentReader].readerName,
              builder: (_, val, child) {
                return Text(
                  val,
                  style: TextStyle(
                      fontSize: SD().PropWidth(30),
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                );
              },
            ),
            SizedBox(
              height: SD().PropHeight(40),
            ),
            Consumer<ReaderP>(
              builder: (cox, val, child) {
                return Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: val.reader[val.currentReader].url.length,
                      itemBuilder: (_, i) {
                        return Container(
                          color: val.currentSora == i
                              ? Color(0xff23266c)
                              : Color(0xff272145),
                          margin: EdgeInsets.only(
                              bottom: 2, top: 2, left: 4, right: 4),
                          child: buildListTile(val, i,context),
                        );
                      }),
                );
              },
            ),
            AudioCard()
          ],
        ),
      ),
      // Align(
      //   alignment: Alignment.bottomCenter,
      //   child: AudioCard()
      // ),
    );
  }


}
