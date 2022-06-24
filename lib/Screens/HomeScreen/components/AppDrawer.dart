import 'package:audioplayer/Screens/FavoScreen/favoriteScreen.dart';
import 'package:audioplayer/appSetting/ScreenDimension.dart';
import 'package:flutter/material.dart';

Align AppDrawer(context) {
  return Align(
    alignment: Alignment.topLeft,
    child: Container(
      margin: EdgeInsets.only(top: 20),
      width: SD.screenWidth / 1.5,
      height: SD.screenHeight / 2.8,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xffacadb3),
          Color(0xfff1f2f6),
          Color(0xff9a9ca3),
        ]),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(SD().PropWidth(150)),
          // topRight: Radius.circular(SD().PropWidth(80)),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Spacer(),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_){
                  return FavoriteScreen();
                }));
              },
                leading: Icon(
                  Icons.favorite,
                  size: SD().PropWidth(30),
                ),
                title: Text(
                  "المفضلة",
                  style: TextStyle(fontSize: SD().PropWidth(20)),
                ),
              ),
            Spacer(),
            ListTile(
              leading: Icon(
                Icons.settings,
                size: SD().PropWidth(30),
              ),
              title: Text(
                "الإعدادات",
                style: TextStyle(fontSize: SD().PropWidth(20)),
              ),
            ),
            Spacer(),
            ListTile(
              leading: Icon(
                Icons.logout,
                size: SD().PropWidth(30),
              ),
              title: Text(
                "تسجبل الخروج",
                style: TextStyle(fontSize: SD().PropWidth(20)),
              ),
            ),
            Spacer(flex: 2,),
          ],
        ),
      ),
    ),
  );
}
