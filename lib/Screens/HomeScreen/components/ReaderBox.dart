import 'package:audioplayer/Providers/ReaderProvider.dart';
import 'package:audioplayer/Screens/HomeScreen/components/FavoriteBox.dart';
import 'package:audioplayer/Screens/SoraList/SoraList.dart';
import 'package:audioplayer/appSetting/ScreenDimension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReaderBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SD.screenHeight * 3 / 4,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xffacadb3),
            Color(0xfff1f2f6),
            Color(0xff9a9ca3),
          ]),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(SD().PropWidth(80)),
            // topRight: Radius.circular(SD().PropWidth(80)),
          ),
          border: Border.all(color: Colors.black, width: 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: SD().PropHeight(20),
          ),
          Container(
            height: SD().PropHeight(200),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Provider.of<ReaderP>(context).reader.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                        onTap: () {
                          Provider.of<ReaderP>(context, listen: false)
                              .ChangeCurrentReader(index);
                          Navigator.push(context, MaterialPageRoute(builder: (_){
                            return SoraList();
                          }));
                        },
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: SD().PropWidth(120),
                                height: SD().PropHeight(190),
                                margin:
                                    EdgeInsets.only(left: 12, bottom: 5, top: 5),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                    color: Color(0xff140d2a),

                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                              color: Colors.black38,
                                              offset: Offset(4, 4),
                                              blurRadius: 2,
                                              spreadRadius: 1)
                                    ]),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Image.asset(
                                        Provider.of<ReaderP>(context)
                                            .reader[index]
                                            .readerImagePath,
                                        width: SD().PropHeight(100),
                                        height: SD().PropHeight(100),
                                      ),
                                    ),
                                    Align(
                                        alignment: Alignment(0, 1),
                                        child: Text(
                                          Provider.of<ReaderP>(context)
                                              .reader[index]
                                              .readerName,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: SD().PropWidth(14),
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Align(
                                        alignment: Alignment(0, 0.6),
                                        child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                              text: "عدد السور : ",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: SD().PropWidth(14),
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  "${Provider.of<ReaderP>(context).reader[index].url.length}",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: SD().PropWidth(14),
                                              ),
                                            )
                                          ]),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )

                );
              },
            ),
          ),
          SizedBox(
            height: SD().PropHeight(20),
          ),
          FavoriteBox(),
        ],
      ),
    );
  }
}
