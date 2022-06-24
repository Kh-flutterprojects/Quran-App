
import 'package:audioplayer/appSetting/ScreenDimension.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Icon.dart';



class AudioCard extends StatefulWidget {
  final audioPath;
  final isSender;


  AudioCard(this.audioPath, this.isSender);

  @override
  _AudioCardState createState() => _AudioCardState();
}

class _AudioCardState extends State<AudioCard> {
  bool waitToGetUrl = true;
  AudioPlayer _audioPlayer = AudioPlayer();
  String completetime = "0:00:00";
  double currenttimeInSecond = 0.0;
  double completetimeInSecond = 1.0;
  double changeInTime = 0.0;
  Duration position = Duration(seconds: 0);
  bool isPlaying = false;
  String currenttime = "0:00:00";
  String text="";

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _audioPlayer.pause();
  }

  @override
  void initState() {
    super.initState();
    PlayAudio();
  }

  void PlayAudio() async {
   await _audioPlayer.setUrl(widget.audioPath);
    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        completetime = duration.toString().split(".")[0];
      });
    });
    _audioPlayer.onAudioPositionChanged.listen((duration) {
      setState(() {
        if (changeInTime >= 0) {
          currenttime = (duration + Duration(seconds: (changeInTime).toInt()))
              .toString()
              .split(".")[0];
          currenttimeInSecond =
              (duration + Duration(seconds: (changeInTime).toInt()))
                  .inSeconds
                  .toDouble();
          position = duration + Duration(seconds: (changeInTime).toInt());
          changeInTime = 0.0;
        } else {
          currenttime =
          (duration - Duration(seconds: (changeInTime * -1).toInt()))
              .toString()
              .split(".")[0];
          currenttimeInSecond =
              (duration - Duration(seconds: (changeInTime * -1).toInt()))
                  .inSeconds
                  .toDouble();
          position = duration - Duration(seconds: (changeInTime * -1).toInt());
          changeInTime = 0.0;
        }
      });
    });
    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        completetime = duration.toString().split(".")[0];
        completetimeInSecond = duration.inSeconds.toDouble();
      });
    });
  setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    PlayAudio();
    return  Container(

          width: double.infinity,
          height: SD().PropHeight(120),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xffc17073),
                Color(0xff9e6161),
                Color(0xff7b3345),
              ],begin:Alignment.topLeft,end: Alignment.bottomRight ),
              boxShadow: [BoxShadow(color:Colors.black54,spreadRadius: 3 )],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        buildIcon(
                          size:40.0,
                          color: Colors.white70,
                          icon:isPlaying == false
                              ? Icons.play_arrow
                              : Icons.pause ,
                          fun:(){
                            setState(() {
                              if (isPlaying == false) {
                                _audioPlayer.resume();
                                isPlaying = !isPlaying;
                              }
                              else {
                                _audioPlayer.pause();
                                isPlaying = !isPlaying;
                              }
                            });
                          } ,),

                        buildIcon(
                          size:40.0,
                          color: Colors.white70,
                          icon:Icons.stop,
                          fun:() {
                            _audioPlayer.stop();
                            setState(() {
                              isPlaying = false;
                              currenttimeInSecond=0.0;
                              currenttime="0:00:00";
                            });
                          },),
                        DefaultTextStyle(style: TextStyle(color: Colors.white,fontSize: 19), child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            buildText2("  "+currenttime),
                            buildText2(" / "),
                            buildText2(completetime),
                          ],
                        ))

                      ],
                    ),
                  ),
                  Slider(
                    min: 0.0,
                    max: completetimeInSecond,
                    divisions: completetimeInSecond.toInt()!=0?completetimeInSecond.toInt():1,
                    value: currenttimeInSecond,
                    activeColor: Colors.white,
                    inactiveColor: Colors.white54,
                    onChanged: (newTime) {
                      setState(() {
                        changeInTime = newTime - currenttimeInSecond;
                        currenttimeInSecond = newTime;
                        _audioPlayer.seek(position);
                      });
                    },
                    label: "$currenttime",
                  ),
                ],
              ),


    );
  }

  Text buildText2(text) {
    return Text(
      text,
    );
  }
}
