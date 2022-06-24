import 'package:audioplayer/Providers/ReaderProvider.dart';
import 'package:audioplayer/Screens/SoraList/componenst/dropDownmenue.dart';
import 'package:audioplayer/appSetting/ScreenDimension.dart';
import 'package:flutter/material.dart';


ListTile buildListTile(ReaderP val, int i,BuildContext context) {
  val.keys.add(GlobalKey());
  return ListTile(contentPadding: EdgeInsets.all(10),
      onTap: () {
        CheckReaderName(val,i);
        val.ChangeisPlay(true);
        val.PlayAudio();
      },
      title: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white70,
            ),
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(val.FavSora[i].readerImagePath,))
              ),

            ),
          ),
          Spacer(flex: 2,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${val.FavSora[i].soraName}",
                style: TextStyle(
                    fontSize: SD().PropWidth(22),
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "${val.FavSora[i].readerName}",
                style: TextStyle(
                    fontSize: SD().PropWidth(14),
                    color: Colors.white,
                   ),
              ),
            ],
          ),
          Spacer(flex: 2,),
          InkWell(
            key: val.keys[i],
            onTap: (){
              Offset pos= val.getWidgetPosition(val.keys[i]);
              dropDownMenu(context, pos,val,i,title: true);
            },
            child: Icon(
              Icons.menu,
              size: 25,
              color: Colors.white,
            ),
          )
        ],
      ),
     );
}

void CheckReaderName(ReaderP val, int i) {
  val.favCurrentSora=i;
  for(var j=0;j<val.reader.length;j++){
    if(val.reader[j].readerName==val.FavSora[i].readerName){
      for(var k=0;k<val.reader[j].url.length;k++){
        if(val.reader[j].soraName[k]==val.FavSora[i].soraName){
          val.currentSora=k;
          break;
        }
      }
      val.ChangeCurrentReader(j);
      break;
    }
  }

}