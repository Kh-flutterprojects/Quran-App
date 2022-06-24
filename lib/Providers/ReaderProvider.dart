import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../LocalDatabase/Reader.dart';

class ReaderP with ChangeNotifier {
  int currentSora = 0;
  int favCurrentSora = 0;
  int currentReader = 0;
  List<GlobalKey> keys = [];
  List<Reader> reader = [];
  List<Sora> FavSora = [];

  ///those variable related to TextFiled in the home screen
  var searchCont = TextEditingController();
  Widget suggsList = Container();
  var filedKey = GlobalKey();

  var isLoded = false;
  AudioPlayer audioPlayer = AudioPlayer();
  var isPlay = true;
  String soraNameFav = "";
  String readerNameFav = "";
  String completetime = "0:00:00";
  String currenttime = "0:00:00";
  double currenttimeInSecond = 0.0;
  double completetimeInSecond = 1.0;
  Duration position = Duration(seconds: 0);
  String text = "";

  ChangeReader() {
    notifyListeners();
  }

  ChangeisPlay(val) {
    isPlay = val;
    notifyListeners();
  }

  void ChangeCurrentSora(val) {
    currentSora = val;
    notifyListeners();
  }

  void ChangeCurrentReader(val) {
    currentReader = val;
    notifyListeners();
  }

  void PlayAudio() {
    isPlay = true;
    audioPlayer.play(reader[currentReader].url[currentSora]);
    audioPlayer.onDurationChanged.listen((duration) {
      completetime = duration.toString().split(".")[0];
    });
    moveProggres();
  }

  StopAudio() {
    audioPlayer.pause();
    isPlay = false;
    currenttime = "00:00:00";
    currenttimeInSecond = 0;
    notifyListeners();
  }

  moveProggres() {
    audioPlayer.onAudioPositionChanged.listen((duration) {
      currenttime = duration.toString().split(".")[0];
      currenttimeInSecond = (duration).inSeconds.toDouble();
      position = duration;
      if ((completetimeInSecond * 1000 - duration.inMilliseconds) <= 200) {
        isPlay = false;
        currenttime = completetime;
        currenttimeInSecond = completetimeInSecond;
        audioPlayer.stop();
      }
      notifyListeners();
    });

    audioPlayer.onDurationChanged.listen((duration) {
      completetime = duration.toString().split(".")[0];
      completetimeInSecond = duration.inSeconds.toDouble();
    });
  }

  OnAudioChangePosition(double newTime) {
    if (audioPlayer.state == PlayerState.PLAYING) {
      audioPlayer.seek(Duration(seconds: newTime.toInt()));
      notifyListeners();
    }
  }

  Offset getWidgetPosition(GlobalKey key) {
    RenderBox box = key.currentContext!.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero); //this is global position

    return position;
  }

  Size getSize(GlobalKey key) {
    RenderBox box = key.currentContext!.findRenderObject() as RenderBox;
    Size position = box.size; //this is global position

    return position;
  }

  void SetPlayAudio(url) {
    isPlay = true;
    audioPlayer.play(url);
    audioPlayer.onDurationChanged.listen((duration) {
      completetime = duration.toString().split(".")[0];
    });
    moveProggres();
  }

  showSuggs(list) {
    suggsList = list;
    notifyListeners();
  }

  void RemoveFromFav(int i) {
    FavSora.removeAt(i);
    notifyListeners();
  }

  void RemoveFromList() {
    reader[currentReader].url.removeAt(currentSora);
    reader[currentReader].soraName.removeAt(currentSora);
    notifyListeners();
  }
}
