import 'package:audioplayer/Providers/ReaderProvider.dart';
import 'package:audioplayer/Screens/SoraList/componenst/dropDownmenue.dart';
import 'package:audioplayer/appSetting/ScreenDimension.dart';
import 'package:flutter/material.dart';


ListTile buildListTile(ReaderP val, int i,BuildContext context) {
  val.keys.add(GlobalKey());
  return ListTile(contentPadding: EdgeInsets.all(10),
      onTap: () {
        val.ChangeCurrentSora(i);
        val.ChangeisPlay(true);
        val.PlayAudio();
      },
      leading: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white70,
        ),
        child: Icon(
          Icons.play_circle_fill_outlined,
          size: 45,
          color: Colors.black,
        ),
      ),
      title: Text(
        "${val.reader[val.currentReader].soraName[i]}",
        style: TextStyle(
            fontSize: SD().PropWidth(18),
            color: Colors.white,
            fontWeight: FontWeight.bold),
      ),
      trailing: InkWell(
        key: val.keys[i],
        onTap: (){
          Offset pos= val.getWidgetPosition(val.keys[i]);
          dropDownMenu(context, pos,val,i);
        },
        child: Icon(
          Icons.menu,
          size: 25,
          color: Colors.white,
        ),
      ));
}