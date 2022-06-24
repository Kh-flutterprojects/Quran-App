
import 'package:audioplayer/Providers/ReaderProvider.dart';
import 'package:audioplayer/Screens/FavoScreen/compents/favListTile.dart';
import 'package:audioplayer/Screens/SoraList/componenst/buildAudioCard.dart';
import 'package:audioplayer/appSetting/ScreenDimension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

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
            Consumer<ReaderP>(
              builder: (cox, val, child) {
                return Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: val.FavSora.length,
                      itemBuilder: (_, i) {
                        return Container(
                          color: val.favCurrentSora == i
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
