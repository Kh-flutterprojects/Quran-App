import 'package:audioplayer/Providers/ReaderProvider.dart';
import 'package:audioplayer/Screens/AudioScreen/fullscreen.dart';
import 'package:audioplayer/Screens/FavoScreen/compents/favListTile.dart';
import 'package:audioplayer/appSetting/ScreenDimension.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AudioCard extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Provider.of<ReaderP>(context,listen: false).PlayAudio();
    return Container(
                  padding: EdgeInsets.only(top: 5),
                  width: double.infinity,
                  height: SD().PropHeight(140),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xffacadb3),
                        Color(0xfff1f2f6),
                        Color(0xff9a9ca3),
                      ]),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40))),
                  child: Consumer<ReaderP>(
                         builder: (_, val, child) {
                           return Column(children: [
                             GestureDetector(
                               onTap: (){
                                 Navigator.push(context, MaterialPageRoute(builder: (_){
                                   return FullScreen();
                                 }));
                               },
                               child: Icon(
                                 CupertinoIcons.chevron_up_circle_fill,
                                 size: SD().PropWidth(30),
                                 color: Colors.black,
                               ),
                             ),
                             SizedBox(height: SD().PropHeight(5),),
                             Stack(
                               children: [
                                 Align(
                                   alignment: Alignment(0.8, 1),
                                   child: Column(
                                     children: [
                                       Text(
                                         val.reader[val.currentReader]
                                             .soraName[val.currentSora],
                                         style: TextStyle(color: Colors.black,
                                             fontSize: SD().PropWidth(20),
                                             fontWeight: FontWeight.bold),
                                       ),
                                       Text(
                                         val.reader[val.currentReader].readerName,
                                         style: TextStyle(color: Colors.black,
                                             fontSize: SD().PropWidth(16)),
                                       ),
                                     ],
                                   ),
                                 ),
                                 Align(
                                   alignment: Alignment(-0.15, 1),
                                   child: IconButton(
                                     icon: Icon(
                                       CupertinoIcons.forward_end_fill,
                                       color: Colors.black,
                                       size: SD().PropWidth(30),
                                     ),
                                     onPressed:  () {
                                       if (val.currentSora + 1 <
                                           val.reader[val.currentReader].url.length) {
                                         val.ChangeCurrentSora(val.currentSora + 1);
                                         val.StopAudio();
                                         val.PlayAudio();
                                       } else {
                                         val.ChangeCurrentSora(0);
                                         val.StopAudio();
                                         val.PlayAudio();
                                       }
                                     },
                                   ),
                                 ),
                                 Align(
                                   alignment: Alignment(-0.4, 1),
                                   child: IconButton(
                                     icon: Icon(
                                       val.isPlay == false
                                           ? CupertinoIcons.play_circle_fill
                                           : Icons.pause,
                                       size: SD().PropWidth(40),
                                       color: Colors.black,
                                     ),
                                     onPressed: () {
                                         if (val.isPlay == false) {
                                           val.audioPlayer.resume();
                                           val.ChangeisPlay(true);
                                         } else {
                                           val.audioPlayer.pause();
                                           val.ChangeisPlay(false);
                                         }
                                     },
                                   ),

                                 ),
                                 Align(
                                   alignment: Alignment(-0.7, 1),
                                   child: IconButton(
                                     icon: Icon(
                                       CupertinoIcons.backward_end_fill,
                                       color: Colors.black,
                                       size: SD().PropWidth(30),
                                     ),
                                     onPressed: () {
                                       if (val.currentSora - 1 >= 0) {
                                         val.ChangeCurrentSora(val.currentSora - 1);
                                         val.StopAudio();
                                         val.PlayAudio();
                                       } else {
                                         val.ChangeCurrentSora(
                                             val.reader[val.currentReader].url.length - 1);
                                         val.StopAudio();
                                         val.PlayAudio();
                                       }
                                     },
                                   ),
                                 ),
                               ],
                             ),
                           ]);

                         }

                  ),

                  // Slider(
                  //   min: 0.0,
                  //   max: completetimeInSecond,
                  //   divisions: completetimeInSecond.toInt()!=0?completetimeInSecond.toInt():1,
                  //   value: currenttimeInSecond,
                  //   activeColor: Colors.black,
                  //   inactiveColor: Colors.black45,
                  //   onChanged: (newTime) {
                  //     setState(() {
                  //       changeInTime = newTime - currenttimeInSecond;
                  //       currenttimeInSecond = newTime;
                  //       _audioPlayer.seek(position);
                  //     });
                  //   },
                  //   label: "$currenttime",
                  // ),


    );
  }


}
