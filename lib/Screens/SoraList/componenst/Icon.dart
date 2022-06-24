import 'package:audioplayer/appSetting/ScreenDimension.dart';
import 'package:flutter/material.dart';
buildIcon({icon ,fun}){
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(spreadRadius: SD().PropWidth(6),color:Color(0xff161032))
          ]
      ),
      child: MaterialButton(
        elevation: 8,
        color: Color(0xffc9c9cd),
        shape: CircleBorder(),
        onPressed: fun,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: Color(0xFF1B0F3E),
            size: SD().PropWidth(30),
          ),
        ),
      ),
    );

}