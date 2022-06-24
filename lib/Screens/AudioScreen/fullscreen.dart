import 'package:audioplayer/Providers/ReaderProvider.dart';
import 'package:audioplayer/Screens/SoraList/componenst/Icon.dart';
import 'package:audioplayer/appSetting/ScreenDimension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class FullScreen extends StatelessWidget {
  final isFav;
  FullScreen({this.isFav=false});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff140d2a),
        appBar: AppBar(
          title: Selector<ReaderP, String>(
            selector: (cox, val) => isFav?val.readerNameFav:val.reader[val.currentReader].readerName,
            builder: (_, val, child) {
              return Text(
                val, style: TextStyle(
                    fontSize: SD().PropWidth(20),
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              );
            },
          ),
          centerTitle: true,
          backgroundColor: Color(0xff140d2a),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 25),
          width: double.infinity,
          height: SD.screenHeight,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xffacadb3),
                Color(0xfff1f2f6),
                Color(0xff9a9ca3),
              ]),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(60), topLeft: Radius.circular(60))),
          child: Consumer<ReaderP>(builder: (_, val, child) {
            return Column(children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  CupertinoIcons.chevron_down_circle_fill,
                  size: SD().PropWidth(30),
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: SD().PropHeight(40),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  SleekCircularSlider(
                    min: 0.0,
                    max: val.completetimeInSecond,
                    initialValue: val.currenttimeInSecond,
                    appearance: CircularSliderAppearance(
                      angleRange: 360,
                      customWidths: CustomSliderWidths(
                        trackWidth: 5,
                        progressBarWidth: 10,
                      ),
                      size: SD().PropHeight(270),
                      customColors: CustomSliderColors(
                          dotColor: Colors.white,
                          trackColor: Color(0xFF29175C),
                          progressBarColor: Color(0xFF29175C)),
                    ),
                    onChange: (double newTime) {
                      val.OnAudioChangePosition(newTime);
                    },
                  ),
                  Container(
                    height: SD().PropHeight(240),
                    width: SD().PropHeight(240),
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(
                        val.reader[val.currentReader].readerImagePath,
                      ), )
                    ),
                  )
                ],
              ),
              SizedBox(
                height: SD().PropHeight(40),
              ),
              Text(
                isFav?val.soraNameFav:val.reader[val.currentReader].soraName[val.currentSora],
                style: TextStyle(
                    color: Colors.black,
                    fontSize: SD().PropWidth(30),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: SD().PropHeight(10),
              ),
              Text(
                val.currenttime + " / " + val.completetime,
                style: TextStyle(
                    color: Colors.black, fontSize: SD().PropWidth(25)),
              ),
              SizedBox(
                height: SD().PropHeight(40),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildIcon(
                    icon: CupertinoIcons.backward_fill,
                    fun: () {
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
                  SizedBox(
                    width: SD().PropWidth(5),
                  ),
                  buildIcon(
                    icon: val.isPlay == false
                        ? CupertinoIcons.play_arrow_solid
                        : Icons.pause_outlined,
                    fun: () {
                      if (val.isPlay == false) {
                        val.audioPlayer.resume();
                        val.ChangeisPlay(true);
                      } else {
                        val.audioPlayer.pause();
                        val.ChangeisPlay(false);
                      }
                    },
                  ),
                  SizedBox(
                    width: SD().PropWidth(5),
                  ),
                  buildIcon(
                    icon: CupertinoIcons.stop_fill,
                    fun: () {
                      val.StopAudio();
                    },
                  ),
                  SizedBox(
                    width: SD().PropWidth(10),
                  ),
                  buildIcon(
                    icon: CupertinoIcons.forward_fill,
                    fun: () {
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
                ],
              )
            ]);
          }),
        ));
  }
}
