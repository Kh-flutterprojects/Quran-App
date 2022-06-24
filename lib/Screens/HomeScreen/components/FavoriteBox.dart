import 'package:audioplayer/Providers/ReaderProvider.dart';
import 'package:audioplayer/Screens/AudioScreen/fullscreen.dart';
import 'package:audioplayer/appSetting/ScreenDimension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteBox extends StatelessWidget {
  const FavoriteBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Provider.of<ReaderP>(context).FavSora.length != 0
          ? Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      "الأكثر استماعاً",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: SD().PropWidth(20)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Consumer<ReaderP>(
                      builder: (_, val, child) {
                        return ListView.builder(
                          itemCount: val.FavSora.length,
                          padding: EdgeInsets.all(0),
                          itemBuilder: (_, index) {
                            return Container(
                                child: Column(
                              children: [
                                ListTile(
                                  onTap: () {
                                    val.SetPlayAudio(val.FavSora[index].url);
                                    val.soraNameFav=val.FavSora[index].soraName;
                                    val.readerNameFav=val.FavSora[index].readerName;
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) {
                                      return FullScreen(isFav: true,);
                                    }));
                                  },
                                  shape: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.black)),
                                  leading: Icon(
                                    Icons.play_circle,
                                    size: 45,
                                    color: Color(0xff16205e),
                                  ),
                                  title: Text(
                                    "${val.FavSora[index].soraName}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: SD().PropWidth(18)),
                                  ),
                                  trailing: Text(
                                    "${val.FavSora[index].readerName}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: SD().PropWidth(14)),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black,
                                  height: 8,
                                )
                              ],
                            ));
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          : Container(),
    );
  }
}
