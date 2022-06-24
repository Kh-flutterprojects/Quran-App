import 'package:audioplayer/LocalDatabase/LDbase.dart';
import 'package:audioplayer/LocalDatabase/Reader.dart';
import 'package:audioplayer/Providers/ReaderProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

dropDownMenu(context, Offset pos,ReaderP val, int i,{title=false}) {

  return showMenu(
      context: context,
      useRootNavigator: true,
      position: RelativeRect.fromLTRB(-0.2, pos.dy + pos.dy / 8, 0, 0),
      color:  Color(0xff140d2a),
      shape: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      items: [
        PopupMenuItem<String>(
            padding: EdgeInsets.only(bottom:5),
            child:title?Container(): ListTile(
              onTap: () async {
                Navigator.pop(context);
                var sora= Sora(
                  isFav: "true",
                  readerImagePath: val.reader[val.currentReader].readerImagePath,
                  readerName: val.reader[val.currentReader].readerName,
                  soraName: val.reader[val.currentReader].soraName[i],
                  url: val.reader[val.currentReader].url[i],
                );
                val.FavSora.add(sora);
                await LDBase.ldb.update(sora);
              },
                tileColor: Color(0xff272145),
                leading: Icon(Icons.favorite,color: Colors.white,),
                title: Center(child: Text("إضافة إلى القائمة المفضلة",style: TextStyle(color:Colors.white),)))),
        PopupMenuItem<String>(
            padding: EdgeInsets.all(0),
            child: ListTile(
              onTap: () async {
                Navigator.pop(context);
                if(title){
                  var sora= Sora(
                    isFav: "false",
                    readerImagePath: val.reader[val.currentReader].readerImagePath,
                    readerName: val.reader[val.currentReader].readerName,
                    soraName: val.reader[val.currentReader].soraName[i],
                    url: val.reader[val.currentReader].url[i],
                  );
                  val.RemoveFromFav(i);
                  await LDBase.ldb.update(sora);
                }else{
                  val.RemoveFromList();
                }

              },
                tileColor: Color(0xff272145),
                leading: Icon(CupertinoIcons.clear,color: Colors.white,),
                title: Center(child: Text("إزالة من القائمة",style: TextStyle(color:Colors.white),)))),

      ]);
}
