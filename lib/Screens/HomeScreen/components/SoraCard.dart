import 'package:audioplayer/LocalDatabase/Reader.dart';
import 'package:audioplayer/Providers/ReaderProvider.dart';
import 'package:audioplayer/Screens/AudioScreen/fullscreen.dart';
import 'package:audioplayer/appSetting/ScreenDimension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

SoraCard(List<Sora> sgn,context) {
  var pos = Provider.of<ReaderP>(context,listen: false).getWidgetPosition(Provider.of<ReaderP>(context,listen: false).filedKey);
  var siz = Provider.of<ReaderP>(context,listen: false).getSize(Provider.of<ReaderP>(context,listen: false).filedKey);

  return Positioned(
      top: pos.dy+SD().PropHeight(60),
      left: pos.dx,
      height:SD.screenHeight/1.5,
      width: siz.width,
      child: Padding(
        padding: const EdgeInsets.only(top: 2,right: 8.0),
        child: Container(
          color: Colors.black12,
          child: GridView.builder(
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              padding: EdgeInsets.all(0.0),
                itemCount: sgn.length,
                itemBuilder: (_,i){
                return InkWell(
                  onTap: ()  {
                  FocusScope.of(context).requestFocus(FocusNode());
                  Provider.of<ReaderP>(context,listen: false).SetPlayAudio(sgn[i].url);
                   Future.delayed(Duration(microseconds: 500),(){
                   Navigator.push(context, MaterialPageRoute(builder: (_){
                     return FullScreen();
                   }));
                 });

                  },
                  child: Container(
                    width: SD().PropWidth(siz.width/2.2),
                    height: SD().PropHeight(190),
                    margin:
                    EdgeInsets.only(left: 12, bottom: 5, top: 5),
                    padding: EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: Color(0xffe7e7ee),
                        borderRadius: BorderRadius.circular(20),),
                    child:Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset(
                            sgn[i].readerImagePath,
                            width: SD().PropHeight(100),
                            height: SD().PropHeight(100),
                          ),
                        ),
                        Align(
                            alignment: Alignment(0, 1),
                            child: Text(
                            sgn[i].soraName,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: SD().PropWidth(14),
                                  fontWeight: FontWeight.bold),
                            )),
                        Align(
                            alignment: Alignment(0, 0.6),
                            child: Text(
                              sgn[i].readerName,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: SD().PropWidth(14),
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  ),
                );
                  // return Container(
                  //   color: Colors.white,
                  //   child: ListTile(
                  //     tileColor: Colors.white,
                  //     leading: Container(
                  //       height: 40,
                  //       width: 40,
                  //       decoration: BoxDecoration(
                  //         shape: BoxShape.circle,
                  //         image: DecorationImage(image: AssetImage(sgn[i].readerImagePath))
                  //       ),
                  //     ),
                  //     title: Center(child: Text(sgn[i].soraName)),
                  //     trailing:Text(sgn[i].readerName),
                  //   ),
                  // );
                }),
        ),
      ),

  );

}
